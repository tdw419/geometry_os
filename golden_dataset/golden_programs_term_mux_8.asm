; DESCRIPTION: A colored object centered at the screen with fixed size.

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
    LDI r10, 0
    FILL r10

    ; Initialize shared state
    LDI r11, 0xF00
    LDI r10, 0
    STORE r11, r10            ; active_session = 0
    ADD r11, r15
    STORE r11, r10            ; session_0_output_len = 0
    ADD r11, r15
    STORE r11, r10            ; session_1_output_len = 0

    ; Initialize scrollback buffers to zero
    ; NOTE: r10 is CMP result register, so use r4 for zero
    LDI r4, 0
    LDI r13, 0x5000
    LDI r6, 0x7000
init_buffers:
    STORE r13, r4
    ADD r13, r15
    CMP r13, r6
    BLT r10, init_buffers

    ; Create pipe pair for session 0
    ; PIPE creates read_fd and write_fd
    LDI r7, 20               ; r20 = read_fd
    LDI r9, 21               ; r21 = write_fd
    PIPE r20, r21

    ; Store pipe fds in RAM
    ; Session 0 stdin pipe: write_fd in r21 (muxer writes to child stdin)
    ; Session 0 stdout pipe: read_fd in r20 (muxer reads child stdout)
    LDI r11, 0x4000
    STORE r11, r20           ; RAM[0x4000] = session_0_stdout_read_fd
    ADD r11, r15
    STORE r11, r21           ; RAM[0x4001] = session_0_stdin_write_fd

    ; Store child PID
    LDI r11, 0x4002
    LDI r10, 0
    STORE r11, r10            ; session_0_pid = 0 (not spawned yet)

    ; Create pipe pair for session 1
    LDI r7, 22
    LDI r9, 23
    PIPE r22, r23

    LDI r11, 0x4010
    STORE r11, r22           ; RAM[0x4010] = session_1_stdout_read_fd
    ADD r11, r15
    STORE r11, r23           ; RAM[0x4011] = session_1_stdin_write_fd

    LDI r11, 0x4012
    LDI r10, 0
    STORE r11, r10            ; session_1_pid = 0

    ; Draw status bar at top
    CALL draw_status_bar

    ; ═══════════════════════════════════════════════════════════════
    ; Main loop: read keyboard, route to session, render output
    ; ═══════════════════════════════════════════════════════════════
main_loop:
    IKEY r11                 ; read key from keyboard port

    ; Check for session switch keys
    LDI r13, 1               ; Ctrl+1
    CMP r11, r13
    JZ r10, switch_to_0

    LDI r13, 2               ; Ctrl+2
    CMP r11, r13
    JZ r10, switch_to_1

    ; If key > 0, write to active session's stdin pipe
    JZ r11, read_output

    ; Get active session
    LDI r6, 0xF00
    LOAD r6, r6            ; r6 = active_session

    ; Get stdin_write_fd for active session
    LDI r12, 0x4001          ; base + 1 for stdin_write_fd
    LDI r1, 16              ; offset between sessions (0x4011 - 0x4001)
    MUL r6, r1
    ADD r12, r6             ; r12 = &session[active].stdin_write_fd
    LOAD r12, r12            ; r12 = stdin_write_fd

    ; Write key to pipe: WRITE fd_reg, buf_reg, len_reg
    LDI r8, 0x4080          ; temp buffer for key
    STORE r8, r11
    LDI r16, 1               ; length = 1 word
    WRITE r12, r8, r16

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
    LDI r13, 0
    STORE r11, r13
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Switch to session 1
; ═══════════════════════════════════════════════════════════════
switch_to_1:
    LDI r11, 0xF00
    LDI r13, 1
    STORE r11, r13
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Draw status bar at top of screen
; ═══════════════════════════════════════════════════════════════
draw_status_bar:
    PUSH r31
    ; Background bar
    LDI r10, 0
    LDI r7, 0
    LDI r9, 256
    LDI r3, 12
    LDI r5, 0x1A1A2E        ; dark blue
    RECTF r10, r7, r9, r3, r5

    ; Draw "S0" indicator (session 0)
    LDI r10, 0xF00
    LOAD r10, r10              ; active_session
    JZ r10, s0_active

    ; Session 0 inactive - dim color
    LDI r0, 0x444466
    JMP draw_s0
s0_active:
    LDI r0, 0x44FF44         ; bright green for active
draw_s0:
    ; Draw "0" at position (4, 3)
    LDI r10, 4
    LDI r7, 3
    PSET r10, r7, r0
    LDI r10, 5
    PSET r10, r7, r0

    ; Draw "1" indicator (session 1)
    LDI r10, 0xF00
    LOAD r10, r10
    LDI r13, 1
    CMP r10, r13
    JZ r10, s1_active
    LDI r0, 0x444466         ; dim
    JMP draw_s1
s1_active:
    LDI r0, 0x44FF44         ; bright green
draw_s1:
    LDI r10, 8
    LDI r7, 3
    PSET r10, r7, r0
    LDI r10, 9
    PSET r10, r7, r0

    ; Draw separator
    LDI r0, 0x888888
    LDI r10, 7
    LDI r7, 2
    LDI r9, 7
    LDI r3, 10
    LINE r10, r7, r9, r3, r0

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
    LDI r13, 0x4090          ; read buffer
    LDI r6, 1               ; read 1 word
    READ r11, r13, r6

    ; Read from session 1 stdout pipe
    LDI r11, 0x4010
    LOAD r11, r11            ; r11 = session_1_stdout_read_fd
    LDI r13, 0x40A0          ; read buffer
    LDI r6, 1               ; read 1 word
    READ r11, r13, r6

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
    LDI r13, 0x5000          ; session 0 buffer
    JZ r11, render_buf
    LDI r13, 0x6000          ; session 1 buffer

render_buf:
    ; Simple render: draw first 244 rows of scrollback as colored pixels
    ; (each word = one pixel, rendered at y+12 to leave room for status bar)
    LDI r6, 0               ; row counter
    LDI r12, 256              ; width
    LDI r1, 244              ; max rows to render
    LDI r8, 12               ; y offset (below status bar)

render_row:
    LDI r16, 0               ; col counter

render_col:
    ; Compute buffer address
    MOV r17, r6
    MUL r17, r12             ; row * 256
    ADD r17, r16             ; + col
    MOV r18, r13
    ADD r18, r17             ; buf + offset
    LOAD r18, r18            ; pixel value

    ; Only draw non-zero pixels
    JZ r18, skip_pixel

    ; Draw pixel
    MOV r19, r16             ; x = col
    MOV r20, r6
    ADD r20, r8             ; y = row + offset
    PSET r19, r20, r18

skip_pixel:
    ADD r16, r15              ; col++
    CMP r16, r12
    BLT r10, render_col

    ADD r6, r15              ; row++
    CMP r6, r1
    BLT r10, render_row

    POP r31
    RET

HALT
