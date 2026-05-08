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
    LDI r15, 1
    LDI r2, 0xFF00
    MOV r30, r2              ; SP = 0xFF00

    ; Clear screen
    LDI r8, 0
    FILL r8

    ; Initialize shared state
    LDI r12, 0xF00
    LDI r8, 0
    STORE r12, r8            ; active_session = 0
    ADD r12, r15
    STORE r12, r8            ; session_0_output_len = 0
    ADD r12, r15
    STORE r12, r8            ; session_1_output_len = 0

    ; Initialize scrollback buffers to zero
    ; NOTE: r8 is CMP result register, so use r9 for zero
    LDI r9, 0
    LDI r6, 0x5000
    LDI r4, 0x7000
init_buffers:
    STORE r6, r9
    ADD r6, r15
    CMP r6, r4
    BLT r8, init_buffers

    ; Create pipe pair for session 0
    ; PIPE creates read_fd and write_fd
    LDI r11, 20               ; r20 = read_fd
    LDI r7, 21               ; r21 = write_fd
    PIPE r20, r21

    ; Store pipe fds in RAM
    ; Session 0 stdin pipe: write_fd in r21 (muxer writes to child stdin)
    ; Session 0 stdout pipe: read_fd in r20 (muxer reads child stdout)
    LDI r12, 0x4000
    STORE r12, r20           ; RAM[0x4000] = session_0_stdout_read_fd
    ADD r12, r15
    STORE r12, r21           ; RAM[0x4001] = session_0_stdin_write_fd

    ; Store child PID
    LDI r12, 0x4002
    LDI r8, 0
    STORE r12, r8            ; session_0_pid = 0 (not spawned yet)

    ; Create pipe pair for session 1
    LDI r11, 22
    LDI r7, 23
    PIPE r22, r23

    LDI r12, 0x4010
    STORE r12, r22           ; RAM[0x4010] = session_1_stdout_read_fd
    ADD r12, r15
    STORE r12, r23           ; RAM[0x4011] = session_1_stdin_write_fd

    LDI r12, 0x4012
    LDI r8, 0
    STORE r12, r8            ; session_1_pid = 0

    ; Draw status bar at top
    CALL draw_status_bar

    ; ═══════════════════════════════════════════════════════════════
    ; Main loop: read keyboard, route to session, render output
    ; ═══════════════════════════════════════════════════════════════
main_loop:
    IKEY r12                 ; read key from keyboard port

    ; Check for session switch keys
    LDI r6, 1               ; Ctrl+1
    CMP r12, r6
    JZ r8, switch_to_0

    LDI r6, 2               ; Ctrl+2
    CMP r12, r6
    JZ r8, switch_to_1

    ; If key > 0, write to active session's stdin pipe
    JZ r12, read_output

    ; Get active session
    LDI r4, 0xF00
    LOAD r4, r4            ; r4 = active_session

    ; Get stdin_write_fd for active session
    LDI r13, 0x4001          ; base + 1 for stdin_write_fd
    LDI r1, 16              ; offset between sessions (0x4011 - 0x4001)
    MUL r4, r1
    ADD r13, r4             ; r13 = &session[active].stdin_write_fd
    LOAD r13, r13            ; r13 = stdin_write_fd

    ; Write key to pipe: WRITE fd_reg, buf_reg, len_reg
    LDI r0, 0x4080          ; temp buffer for key
    STORE r0, r12
    LDI r16, 1               ; length = 1 word
    WRITE r13, r0, r16

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
    LDI r12, 0xF00
    LDI r6, 0
    STORE r12, r6
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Switch to session 1
; ═══════════════════════════════════════════════════════════════
switch_to_1:
    LDI r12, 0xF00
    LDI r6, 1
    STORE r12, r6
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Draw status bar at top of screen
; ═══════════════════════════════════════════════════════════════
draw_status_bar:
    PUSH r31
    ; Background bar
    LDI r8, 0
    LDI r11, 0
    LDI r7, 256
    LDI r10, 12
    LDI r3, 0x1A1A2E        ; dark blue
    RECTF r8, r11, r7, r10, r3

    ; Draw "S0" indicator (session 0)
    LDI r8, 0xF00
    LOAD r8, r8              ; active_session
    JZ r8, s0_active

    ; Session 0 inactive - dim color
    LDI r14, 0x444466
    JMP draw_s0
s0_active:
    LDI r14, 0x44FF44         ; bright green for active
draw_s0:
    ; Draw "0" at position (4, 3)
    LDI r8, 4
    LDI r11, 3
    PSET r8, r11, r14
    LDI r8, 5
    PSET r8, r11, r14

    ; Draw "1" indicator (session 1)
    LDI r8, 0xF00
    LOAD r8, r8
    LDI r6, 1
    CMP r8, r6
    JZ r8, s1_active
    LDI r14, 0x444466         ; dim
    JMP draw_s1
s1_active:
    LDI r14, 0x44FF44         ; bright green
draw_s1:
    LDI r8, 8
    LDI r11, 3
    PSET r8, r11, r14
    LDI r8, 9
    PSET r8, r11, r14

    ; Draw separator
    LDI r14, 0x888888
    LDI r8, 7
    LDI r11, 2
    LDI r7, 7
    LDI r10, 10
    LINE r8, r11, r7, r10, r14

    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; Read output from both sessions' stdout pipes
; ═══════════════════════════════════════════════════════════════
read_session_output:
    PUSH r31

    ; Read from session 0 stdout pipe
    LDI r12, 0x4000
    LOAD r12, r12            ; r12 = session_0_stdout_read_fd
    LDI r6, 0x4090          ; read buffer
    LDI r4, 1               ; read 1 word
    READ r12, r6, r4

    ; Read from session 1 stdout pipe
    LDI r12, 0x4010
    LOAD r12, r12            ; r12 = session_1_stdout_read_fd
    LDI r6, 0x40A0          ; read buffer
    LDI r4, 1               ; read 1 word
    READ r12, r6, r4

    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; Render active session's scrollback to screen (below status bar)
; ═══════════════════════════════════════════════════════════════
render_active_session:
    PUSH r31
    ; Get active session
    LDI r12, 0xF00
    LOAD r12, r12            ; r12 = active_session

    ; Calculate buffer base address
    LDI r6, 0x5000          ; session 0 buffer
    JZ r12, render_buf
    LDI r6, 0x6000          ; session 1 buffer

render_buf:
    ; Simple render: draw first 244 rows of scrollback as colored pixels
    ; (each word = one pixel, rendered at y+12 to leave room for status bar)
    LDI r4, 0               ; row counter
    LDI r13, 256              ; width
    LDI r1, 244              ; max rows to render
    LDI r0, 12               ; y offset (below status bar)

render_row:
    LDI r16, 0               ; col counter

render_col:
    ; Compute buffer address
    MOV r17, r4
    MUL r17, r13             ; row * 256
    ADD r17, r16             ; + col
    MOV r18, r6
    ADD r18, r17             ; buf + offset
    LOAD r18, r18            ; pixel value

    ; Only draw non-zero pixels
    JZ r18, skip_pixel

    ; Draw pixel
    MOV r19, r16             ; x = col
    MOV r20, r4
    ADD r20, r0             ; y = row + offset
    PSET r19, r20, r18

skip_pixel:
    ADD r16, r15              ; col++
    CMP r16, r13
    BLT r8, render_col

    ADD r4, r15              ; row++
    CMP r4, r1
    BLT r8, render_row

    POP r31
    RET

HALT
