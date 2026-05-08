; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

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
    LDI r12, 1
    LDI r3, 0xFF00
    MOV r30, r3              ; SP = 0xFF00

    ; Clear screen
    LDI r8, 0
    FILL r8

    ; Initialize shared state
    LDI r9, 0xF00
    LDI r8, 0
    STORE r9, r8            ; active_session = 0
    ADD r9, r12
    STORE r9, r8            ; session_0_output_len = 0
    ADD r9, r12
    STORE r9, r8            ; session_1_output_len = 0

    ; Initialize scrollback buffers to zero
    ; NOTE: r8 is CMP result register, so use r11 for zero
    LDI r11, 0
    LDI r15, 0x5000
    LDI r0, 0x7000
init_buffers:
    STORE r15, r11
    ADD r15, r12
    CMP r15, r0
    BLT r8, init_buffers

    ; Create pipe pair for session 0
    ; PIPE creates read_fd and write_fd
    LDI r2, 20               ; r20 = read_fd
    LDI r6, 21               ; r21 = write_fd
    PIPE r20, r21

    ; Store pipe fds in RAM
    ; Session 0 stdin pipe: write_fd in r21 (muxer writes to child stdin)
    ; Session 0 stdout pipe: read_fd in r20 (muxer reads child stdout)
    LDI r9, 0x4000
    STORE r9, r20           ; RAM[0x4000] = session_0_stdout_read_fd
    ADD r9, r12
    STORE r9, r21           ; RAM[0x4001] = session_0_stdin_write_fd

    ; Store child PID
    LDI r9, 0x4002
    LDI r8, 0
    STORE r9, r8            ; session_0_pid = 0 (not spawned yet)

    ; Create pipe pair for session 1
    LDI r2, 22
    LDI r6, 23
    PIPE r22, r23

    LDI r9, 0x4010
    STORE r9, r22           ; RAM[0x4010] = session_1_stdout_read_fd
    ADD r9, r12
    STORE r9, r23           ; RAM[0x4011] = session_1_stdin_write_fd

    LDI r9, 0x4012
    LDI r8, 0
    STORE r9, r8            ; session_1_pid = 0

    ; Draw status bar at top
    CALL draw_status_bar

    ; ═══════════════════════════════════════════════════════════════
    ; Main loop: read keyboard, route to session, render output
    ; ═══════════════════════════════════════════════════════════════
main_loop:
    IKEY r9                 ; read key from keyboard port

    ; Check for session switch keys
    LDI r15, 1               ; Ctrl+1
    CMP r9, r15
    JZ r8, switch_to_0

    LDI r15, 2               ; Ctrl+2
    CMP r9, r15
    JZ r8, switch_to_1

    ; If key > 0, write to active session's stdin pipe
    JZ r9, read_output

    ; Get active session
    LDI r0, 0xF00
    LOAD r0, r0            ; r0 = active_session

    ; Get stdin_write_fd for active session
    LDI r13, 0x4001          ; base + 1 for stdin_write_fd
    LDI r14, 16              ; offset between sessions (0x4011 - 0x4001)
    MUL r0, r14
    ADD r13, r0             ; r13 = &session[active].stdin_write_fd
    LOAD r13, r13            ; r13 = stdin_write_fd

    ; Write key to pipe: WRITE fd_reg, buf_reg, len_reg
    LDI r10, 0x4080          ; temp buffer for key
    STORE r10, r9
    LDI r16, 1               ; length = 1 word
    WRITE r13, r10, r16

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
    LDI r9, 0xF00
    LDI r15, 0
    STORE r9, r15
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Switch to session 1
; ═══════════════════════════════════════════════════════════════
switch_to_1:
    LDI r9, 0xF00
    LDI r15, 1
    STORE r9, r15
    CALL draw_status_bar
    JMP read_output

; ═══════════════════════════════════════════════════════════════
; Draw status bar at top of screen
; ═══════════════════════════════════════════════════════════════
draw_status_bar:
    PUSH r31
    ; Background bar
    LDI r8, 0
    LDI r2, 0
    LDI r6, 256
    LDI r4, 12
    LDI r5, 0x1A1A2E        ; dark blue
    RECTF r8, r2, r6, r4, r5

    ; Draw "S0" indicator (session 0)
    LDI r8, 0xF00
    LOAD r8, r8              ; active_session
    JZ r8, s0_active

    ; Session 0 inactive - dim color
    LDI r1, 0x444466
    JMP draw_s0
s0_active:
    LDI r1, 0x44FF44         ; bright green for active
draw_s0:
    ; Draw "0" at position (4, 3)
    LDI r8, 4
    LDI r2, 3
    PSET r8, r2, r1
    LDI r8, 5
    PSET r8, r2, r1

    ; Draw "1" indicator (session 1)
    LDI r8, 0xF00
    LOAD r8, r8
    LDI r15, 1
    CMP r8, r15
    JZ r8, s1_active
    LDI r1, 0x444466         ; dim
    JMP draw_s1
s1_active:
    LDI r1, 0x44FF44         ; bright green
draw_s1:
    LDI r8, 8
    LDI r2, 3
    PSET r8, r2, r1
    LDI r8, 9
    PSET r8, r2, r1

    ; Draw separator
    LDI r1, 0x888888
    LDI r8, 7
    LDI r2, 2
    LDI r6, 7
    LDI r4, 10
    LINE r8, r2, r6, r4, r1

    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; Read output from both sessions' stdout pipes
; ═══════════════════════════════════════════════════════════════
read_session_output:
    PUSH r31

    ; Read from session 0 stdout pipe
    LDI r9, 0x4000
    LOAD r9, r9            ; r9 = session_0_stdout_read_fd
    LDI r15, 0x4090          ; read buffer
    LDI r0, 1               ; read 1 word
    READ r9, r15, r0

    ; Read from session 1 stdout pipe
    LDI r9, 0x4010
    LOAD r9, r9            ; r9 = session_1_stdout_read_fd
    LDI r15, 0x40A0          ; read buffer
    LDI r0, 1               ; read 1 word
    READ r9, r15, r0

    POP r31
    RET

; ═══════════════════════════════════════════════════════════════
; Render active session's scrollback to screen (below status bar)
; ═══════════════════════════════════════════════════════════════
render_active_session:
    PUSH r31
    ; Get active session
    LDI r9, 0xF00
    LOAD r9, r9            ; r9 = active_session

    ; Calculate buffer base address
    LDI r15, 0x5000          ; session 0 buffer
    JZ r9, render_buf
    LDI r15, 0x6000          ; session 1 buffer

render_buf:
    ; Simple render: draw first 244 rows of scrollback as colored pixels
    ; (each word = one pixel, rendered at y+12 to leave room for status bar)
    LDI r0, 0               ; row counter
    LDI r13, 256              ; width
    LDI r14, 244              ; max rows to render
    LDI r10, 12               ; y offset (below status bar)

render_row:
    LDI r16, 0               ; col counter

render_col:
    ; Compute buffer address
    MOV r17, r0
    MUL r17, r13             ; row * 256
    ADD r17, r16             ; + col
    MOV r18, r15
    ADD r18, r17             ; buf + offset
    LOAD r18, r18            ; pixel value

    ; Only draw non-zero pixels
    JZ r18, skip_pixel

    ; Draw pixel
    MOV r19, r16             ; x = col
    MOV r20, r0
    ADD r20, r10             ; y = row + offset
    PSET r19, r20, r18

skip_pixel:
    ADD r16, r12              ; col++
    CMP r16, r13
    BLT r8, render_col

    ADD r0, r12              ; row++
    CMP r0, r14
    BLT r8, render_row

    POP r31
    RET

HALT
