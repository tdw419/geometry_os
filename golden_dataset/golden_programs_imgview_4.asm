; DESCRIPTION: This GeOS assembly code generates a gradient pattern simulating an image on the screen, draws a UI with a title bar and status bar, and enters a main loop where it handles user input to save screenshots or quit. It uses registers for drawing and managing state, and includes functions for writing filenames and capturing screenshots.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r2, 1
LDI r15, 0          ; overlay timer
LDI r8, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r13, 0          ; y = 0
dg_y:
    LDI r9, 0         ; x = 0
dg_x:
    MOV r12, r9
    LDI r7, 16
    SHL r12, r7        ; R = x << 16
    MOV r14, r13
    LDI r7, 8
    SHL r14, r7        ; G = y << 8
    OR r12, r14
    LDI r14, 128
    OR r12, r14         ; B = 128
    PSET r9, r13, r12
    ADD r9, r2
    LDI r7, 0
    ADD r7, r9
    SUB r7, r8
    JZ r7, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r13, r2
    LDI r7, 0
    ADD r7, r13
    SUB r7, r8
    JZ r7, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r13, 0
LDI r1, 0
LDI r11, 256
LDI r0, 14
LDI r4, 0x222222
RECTF r13, r1, r11, r0, r4

; Highlight bar
LDI r13, 2
LDI r1, 2
LDI r11, 100
LDI r0, 10
LDI r4, 0x8888FF
RECTF r13, r1, r11, r0, r4

; Status bar at bottom
LDI r13, 0
LDI r1, 244
LDI r11, 256
LDI r0, 12
LDI r4, 0x222222
RECTF r13, r1, r11, r0, r4

; ── Screenshot counter at RAM[0x7000] ──
LDI r10, 0x7000
LDI r16, 0
STORE r10, r16

; ── Main loop ──
main_loop:
    IKEY r9
    ; S key = save screenshot
    LDI r20, 83
    CMP r9, r20
    JZ r13, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r9, r20
    JZ r13, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r1
    ; Increment counter
    LDI r10, 0x7000
    LOAD r16, r10
    ADD r16, r2
    STORE r10, r16
    LDI r15, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r15, r20
    JZ r13, do_frame
    ; Draw saved indicator
    LDI r13, 220
    LDI r1, 2
    LDI r11, 34
    LDI r0, 10
    LDI r4, 0x00CC00
    RECTF r13, r1, r11, r0, r4
    SUB r15, r2
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r1, 0x2000
    LDI r7, 118       ; 'v'
    STORE r1, r7
    ADD r1, r2
    LDI r7, 105       ; 'i'
    STORE r1, r7
    ADD r1, r2
    LDI r7, 101       ; 'e'
    STORE r1, r7
    ADD r1, r2
    LDI r7, 119       ; 'w'
    STORE r1, r7
    ADD r1, r2
    LDI r7, 95        ; '_'
    STORE r1, r7
    ADD r1, r2
    ; Append counter as digit
    LDI r10, 0x7000
    LOAD r16, r10
    LDI r7, 48
    ADD r7, r16
    STORE r1, r7
    ADD r1, r2
    LDI r7, 46        ; '.'
    STORE r1, r7
    ADD r1, r2
    LDI r7, 105       ; 'i'
    STORE r1, r7
    ADD r1, r2
    LDI r7, 109       ; 'm'
    STORE r1, r7
    ADD r1, r2
    LDI r7, 103       ; 'g'
    STORE r1, r7
    ADD r1, r2
    LDI r7, 0
    STORE r1, r7
    LDI r1, 0x2000
    POP r31
    RET
