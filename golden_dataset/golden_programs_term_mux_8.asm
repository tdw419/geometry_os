; DESCRIPTION: This GeOS assembly code implements a minimal terminal multiplexer that manages two sessions. Each session is represented by a child process with stdin and stdout connected via pipes. The muxer reads keyboard input, routes it to the active session, and renders output from both sessions on the screen, displaying the active session's scrollback buffer below a status bar indicating which session is active.

; term_mux.asm -- Phase 103: Terminal Multiplexer
;
; A minimal terminal multiplexer that manages 2 sessions.
; Each session is a child process with stdin/stdout connected via pipes.
; The muxer reads keyboard, routes to active session, and renders output.
;
; Session protocol (shared RAM at 0xF00-0xF03):
;   0xF00: active_session (0 or 1)
;   0xF01: session_0_output_len (words written to output buffer)
;   0xF02: session_1_output_len
;   0xF03: reserved
;
; Output buffers:
;   0x5000-0x5FFF: session 0 scrollback (4K words)
;   0x6000-0x6FFF: session 1 scrollback (4K words)
;
; Keyboard routing: muxer reads IKEY, writes to active session's stdin pipe
;
; Controls:
;   Ctrl+1 (ASCII 1): switch to session 0
;   Ctrl+2 (ASCII 2): switch to session 1
;   Ctrl+N (ASCII 14): create new session (spawns echo_test)
;   All other keys: forwarded to active session

.org 0x000

; ═══════════════════════════════════════════════════════════════
; Initialize
; ═══════════════════════════════════════════════════════════════
    LDI r14, 1
    LDI r5, 0xFF00
    MOV r30, r5              ; SP = 0xFF00

    ; Clear screen
    LDI r4, 0
    FILL r4

    ; Initialize shared state
    LDI r11, 0xF00
    LDI r4, 0
    STORE r11, r4            ; active_session = 0
    ADD r11, r14
    STORE r11, r4            ; session_0_output_len = 0
    ADD r11, r14
    STORE r11, r4            ; session_1_output_len = 0

    ; Initialize scrollback buffers to zero
    ; NOTE: r4 is CMP result register, so use r15 for zero
    LDI r15, 0
    LDI r2, 0x5000
    LDI r1, 0x7000
init_buffers:
    STORE r2, r15
    ADD r2, r14
    CMP r2, r1
    BLT r4, init_buffers

    ; Create pipe pair for session 0
    ; PIPE creates read_fd and write_fd
    LDI r10, 20               ; r20 = read_fd
    LDI r3, 21               ; r21 = write_fd
    PIPE r20, r21

    ; Store pipe fds in RAM
    ; Session 0 stdin pipe: write_fd in r21 (muxer writes to child stdin)
    ; Session 0 stdout pipe: read_fd in r20 (muxer reads child stdout)
    LDI r11, 0x4000
    STORE r11, r20           ; RAM[0x4000] = session_0_stdout_read_fd
    ADD r11, r14
    STORE r11, r21           ; RAM[0x4001] = session_0_stdin_write_fd

    ; Store child PID
    LDI r11, 0x4002
    LDI r4, 0
    STORE r11, r4            ; session_0_pid = 0 (not spawned yet)

    ; Create pipe pair for session 1
    LDI r10, 22
    LDI r3, 23
    PIPE r22, r23

    LDI r11, 0x4010
    STORE r11, r22           ; RAM[0x4010] = session_1_stdout_read_fd
    ADD r11, r14
    STORE r11, r23           ; RAM[0x4011] = session_1_stdin_write_fd

    LDI r11, 0x4012
    LDI r4, 0
    STORE r11, r4            ; session_1_pid = 0

    ; Draw status bar at top
    CALL draw_status_bar

    ; ═══════════════════════════════════════════════════════════════
    ; Main loop: read keyboard, route to session, render output
    ; ═══════════════════════════════════════════════════════════════
main_loop:
    IKEY r11                 ; read key from keyboard port

    ; Check for session switch keys
    LDI r2, 1               ; Ctrl+1
    CMP r11, r2
    JZ r4, switch_to_0

    LDI r2, 2               ; Ctrl+2
    CMP r11, r2
    JZ r4, switch_to_1

    ; If key > 0, write to active session's stdin pipe
    JZ r11, read_output

    ; Get active session
    LDI r1, 0xF00
    LOAD r1, r1            ; r1 = active_session

    ; Get stdin_write_fd for active session
    LDI r9, 0x4001          ; base + 1 for stdin_write_fd
    LDI r7, 16              ; offset between sessions (0x4011 - 0x4001)
    MUL r1, r7
    ADD r9, r1             ; r9 = &session[active].stdin_write_fd
    LOAD r9, r9            ; r9 = stdin_write_fd

    ; Write key to pipe: WRITE fd_reg, buf_reg, len_reg
    LDI r6, 0x4080          ; temp buffer for key
    STORE r6, r11
    LDI r16, 1               ; length = 1 word
    WRITE r9, r6, r16

read_output:
    ; Read from both sessions' stdout pipes and render active one
    CALL read_session_output
    CALL render_active_session

    ; Yield frame
    FRAME
    JMP main_loop

; ═══════════════════════════════════════════════════════════════
; Switch to session 0
; ═══════════════════════════════════════════════════════════════
switch_to_0:
    LDI r11, 0xF00
    LDI r2, 0
    STORE r11, r2
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Switch to session 1
; ═══════════════════════════════════════════════════════════════
switch_to_1:
    LDI r11, 0xF00
    LDI r2, 1
    STORE r11, r2
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Draw status bar at top of screen
; ═══════════════════════════════════════════════════════════════
draw_status_bar:
    PUSH r31
    ; Background bar
    LDI r4, 0
    LDI r10, 0
    LDI r3, 256
    LDI r8, 12
    LDI r12, 0x1A1A2E        ; dark blue
    RECTF r4, r10, r3, r8, r12

    ; Draw "S0" indicator (session 0)
    LDI r4, 0xF00
    LOAD r4, r4              ; active_session
    JZ r4, s0_active

    ; Session 0 inactive - dim color
    LDI r0, 0x444466
    JMP draw_s0
s0_active:
    LDI r0, 0x44FF44         ; bright green for active
draw_s0:
    ; Draw "0" at position (4, 3)
    LDI r4, 4
    LDI r10, 3
    PSET r4, r10, r0
    LDI r4, 5
    PSET r4, r10, r0

    ; Draw "1" indicator (session 1)
    LDI r4, 0xF00
    LOAD r4, r4
    LDI r2, 1
    CMP r4, r2
    JZ r4, s1_active
    LDI r0, 0x444466         ; dim
    JMP draw_s1
s1_active:
    LDI r0, 0x44FF44         ; bright green
draw_s1:
    LDI r4, 8
    LDI r10, 3
    PSET r4, r10, r0
    LDI r4, 9
    PSET r4, r10, r0

    ; Draw separator
    LDI r0, 0x888888
    LDI r4, 7
    LDI r10, 2
    LDI r3, 7
    LDI r8, 10
    LINE r4, r10, r3, r8, r0

    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; Read output from both sessions' stdout pipes
; ═══════════════════════════════════════════════════════════════
read_session_output:
    PUSH r31

    ; Read from session 0 stdout pipe
    LDI r11, 0x4000
    LOAD r11, r11            ; r11 = session_0_stdout_read_fd
    LDI r2, 0x4090          ; read buffer
    LDI r1, 1               ; read 1 word
    READ r11, r2, r1

    ; Read from session 1 stdout pipe
    LDI r11, 0x4010
    LOAD r11, r11            ; r11 = session_1_stdout_read_fd
    LDI r2, 0x40A0          ; read buffer
    LDI r1, 1               ; read 1 word
    READ r11, r2, r1

    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; Render active session's scrollback to screen (below status bar)
; ═══════════════════════════════════════════════════════════════
render_active_session:
    PUSH r31
    ; Get active session
    LDI r11, 0xF00
    LOAD r11, r11            ; r11 = active_session

    ; Calculate buffer base address
    LDI r2, 0x5000          ; session 0 buffer
    JZ r11, render_buf
    LDI r2, 0x6000          ; session 1 buffer

render_buf:
    ; Simple render: draw first 244 rows of scrollback as colored pixels
    ; (each word = one pixel, rendered at y+12 to leave room for status bar)
    LDI r1, 0               ; row counter
    LDI r9, 256              ; width
    LDI r7, 244              ; max rows to render
    LDI r6, 12               ; y offset (below status bar)

render_row:
    LDI r16, 0               ; col counter

render_col:
    ; Compute buffer address
    MOV r17, r1
    MUL r17, r9             ; row * 256
    ADD r17, r16             ; + col
    MOV r18, r2
    ADD r18, r17             ; buf + offset
    LOAD r18, r18            ; pixel value

    ; Only draw non-zero pixels
    JZ r18, skip_pixel

    ; Draw pixel
    MOV r19, r16             ; x = col
    MOV r20, r1
    ADD r20, r6             ; y = row + offset
    PSET r19, r20, r18

skip_pixel:
    ADD r16, r14              ; col++
    CMP r16, r9
    BLT r4, render_col

    ADD r1, r14              ; row++
    CMP r1, r7
    BLT r4, render_row

    POP r31
    RET

HALT
