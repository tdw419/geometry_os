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
    LDI r12, 0xFF00
    MOV r30, r12              ; SP = 0xFF00

    ; Clear screen
    LDI r10, 0
    FILL r10

    ; Initialize shared state
    LDI r8, 0xF00
    LDI r10, 0
    STORE r8, r10            ; active_session = 0
    ADD r8, r14
    STORE r8, r10            ; session_0_output_len = 0
    ADD r8, r14
    STORE r8, r10            ; session_1_output_len = 0

    ; Initialize scrollback buffers to zero
    ; NOTE: r10 is CMP result register, so use r6 for zero
    LDI r6, 0
    LDI r11, 0x5000
    LDI r5, 0x7000
init_buffers:
    STORE r11, r6
    ADD r11, r14
    CMP r11, r5
    BLT r10, init_buffers

    ; Create pipe pair for session 0
    ; PIPE creates read_fd and write_fd
    LDI r1, 20               ; r20 = read_fd
    LDI r13, 21               ; r21 = write_fd
    PIPE r20, r21

    ; Store pipe fds in RAM
    ; Session 0 stdin pipe: write_fd in r21 (muxer writes to child stdin)
    ; Session 0 stdout pipe: read_fd in r20 (muxer reads child stdout)
    LDI r8, 0x4000
    STORE r8, r20           ; RAM[0x4000] = session_0_stdout_read_fd
    ADD r8, r14
    STORE r8, r21           ; RAM[0x4001] = session_0_stdin_write_fd

    ; Store child PID
    LDI r8, 0x4002
    LDI r10, 0
    STORE r8, r10            ; session_0_pid = 0 (not spawned yet)

    ; Create pipe pair for session 1
    LDI r1, 22
    LDI r13, 23
    PIPE r22, r23

    LDI r8, 0x4010
    STORE r8, r22           ; RAM[0x4010] = session_1_stdout_read_fd
    ADD r8, r14
    STORE r8, r23           ; RAM[0x4011] = session_1_stdin_write_fd

    LDI r8, 0x4012
    LDI r10, 0
    STORE r8, r10            ; session_1_pid = 0

    ; Draw status bar at top
    CALL draw_status_bar

    ; ═══════════════════════════════════════════════════════════════
    ; Main loop: read keyboard, route to session, render output
    ; ═══════════════════════════════════════════════════════════════
main_loop:
    IKEY r8                 ; read key from keyboard port

    ; Check for session switch keys
    LDI r11, 1               ; Ctrl+1
    CMP r8, r11
    JZ r10, switch_to_0

    LDI r11, 2               ; Ctrl+2
    CMP r8, r11
    JZ r10, switch_to_1

    ; If key > 0, write to active session's stdin pipe
    JZ r8, read_output

    ; Get active session
    LDI r5, 0xF00
    LOAD r5, r5            ; r5 = active_session

    ; Get stdin_write_fd for active session
    LDI r0, 0x4001          ; base + 1 for stdin_write_fd
    LDI r7, 16              ; offset between sessions (0x4011 - 0x4001)
    MUL r5, r7
    ADD r0, r5             ; r0 = &session[active].stdin_write_fd
    LOAD r0, r0            ; r0 = stdin_write_fd

    ; Write key to pipe: WRITE fd_reg, buf_reg, len_reg
    LDI r4, 0x4080          ; temp buffer for key
    STORE r4, r8
    LDI r16, 1               ; length = 1 word
    WRITE r0, r4, r16

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
    LDI r8, 0xF00
    LDI r11, 0
    STORE r8, r11
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Switch to session 1
; ═══════════════════════════════════════════════════════════════
switch_to_1:
    LDI r8, 0xF00
    LDI r11, 1
    STORE r8, r11
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Draw status bar at top of screen
; ═══════════════════════════════════════════════════════════════
draw_status_bar:
    PUSH r31
    ; Background bar
    LDI r10, 0
    LDI r1, 0
    LDI r13, 256
    LDI r2, 12
    LDI r15, 0x1A1A2E        ; dark blue
    RECTF r10, r1, r13, r2, r15

    ; Draw "S0" indicator (session 0)
    LDI r10, 0xF00
    LOAD r10, r10              ; active_session
    JZ r10, s0_active

    ; Session 0 inactive - dim color
    LDI r9, 0x444466
    JMP draw_s0
s0_active:
    LDI r9, 0x44FF44         ; bright green for active
draw_s0:
    ; Draw "0" at position (4, 3)
    LDI r10, 4
    LDI r1, 3
    PSET r10, r1, r9
    LDI r10, 5
    PSET r10, r1, r9

    ; Draw "1" indicator (session 1)
    LDI r10, 0xF00
    LOAD r10, r10
    LDI r11, 1
    CMP r10, r11
    JZ r10, s1_active
    LDI r9, 0x444466         ; dim
    JMP draw_s1
s1_active:
    LDI r9, 0x44FF44         ; bright green
draw_s1:
    LDI r10, 8
    LDI r1, 3
    PSET r10, r1, r9
    LDI r10, 9
    PSET r10, r1, r9

    ; Draw separator
    LDI r9, 0x888888
    LDI r10, 7
    LDI r1, 2
    LDI r13, 7
    LDI r2, 10
    LINE r10, r1, r13, r2, r9

    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; Read output from both sessions' stdout pipes
; ═══════════════════════════════════════════════════════════════
read_session_output:
    PUSH r31

    ; Read from session 0 stdout pipe
    LDI r8, 0x4000
    LOAD r8, r8            ; r8 = session_0_stdout_read_fd
    LDI r11, 0x4090          ; read buffer
    LDI r5, 1               ; read 1 word
    READ r8, r11, r5

    ; Read from session 1 stdout pipe
    LDI r8, 0x4010
    LOAD r8, r8            ; r8 = session_1_stdout_read_fd
    LDI r11, 0x40A0          ; read buffer
    LDI r5, 1               ; read 1 word
    READ r8, r11, r5

    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; Render active session's scrollback to screen (below status bar)
; ═══════════════════════════════════════════════════════════════
render_active_session:
    PUSH r31
    ; Get active session
    LDI r8, 0xF00
    LOAD r8, r8            ; r8 = active_session

    ; Calculate buffer base address
    LDI r11, 0x5000          ; session 0 buffer
    JZ r8, render_buf
    LDI r11, 0x6000          ; session 1 buffer

render_buf:
    ; Simple render: draw first 244 rows of scrollback as colored pixels
    ; (each word = one pixel, rendered at y+12 to leave room for status bar)
    LDI r5, 0               ; row counter
    LDI r0, 256              ; width
    LDI r7, 244              ; max rows to render
    LDI r4, 12               ; y offset (below status bar)

render_row:
    LDI r16, 0               ; col counter

render_col:
    ; Compute buffer address
    MOV r17, r5
    MUL r17, r0             ; row * 256
    ADD r17, r16             ; + col
    MOV r18, r11
    ADD r18, r17             ; buf + offset
    LOAD r18, r18            ; pixel value

    ; Only draw non-zero pixels
    JZ r18, skip_pixel

    ; Draw pixel
    MOV r19, r16             ; x = col
    MOV r20, r5
    ADD r20, r4             ; y = row + offset
    PSET r19, r20, r18

skip_pixel:
    ADD r16, r14              ; col++
    CMP r16, r0
    BLT r10, render_col

    ADD r5, r14              ; row++
    CMP r5, r7
    BLT r10, render_row

    POP r31
    RET

HALT
