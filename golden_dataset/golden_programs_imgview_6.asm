; DESCRIPTION: This GeOS assembly code generates a gradient pattern simulating an image on the screen, draws a UI with a title bar and status bar, and enters a main loop where it handles user input to save screenshots or quit. It uses registers for drawing and managing state, and includes functions for writing filenames and capturing screenshots.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r6, 1
LDI r7, 0          ; overlay timer
LDI r14, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r11, 0          ; y = 0
dg_y:
    LDI r8, 0         ; x = 0
dg_x:
    MOV r13, r8
    LDI r5, 16
    SHL r13, r5        ; R = x << 16
    MOV r12, r11
    LDI r5, 8
    SHL r12, r5        ; G = y << 8
    OR r13, r12
    LDI r12, 128
    OR r13, r12         ; B = 128
    PSET r8, r11, r13
    ADD r8, r6
    LDI r5, 0
    ADD r5, r8
    SUB r5, r14
    JZ r5, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r11, r6
    LDI r5, 0
    ADD r5, r11
    SUB r5, r14
    JZ r5, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r11, 0
LDI r1, 0
LDI r2, 256
LDI r3, 14
LDI r9, 0x222222
RECTF r11, r1, r2, r3, r9

; Highlight bar
LDI r11, 2
LDI r1, 2
LDI r2, 100
LDI r3, 10
LDI r9, 0x8888FF
RECTF r11, r1, r2, r3, r9

; Status bar at bottom
LDI r11, 0
LDI r1, 244
LDI r2, 256
LDI r3, 12
LDI r9, 0x222222
RECTF r11, r1, r2, r3, r9

; ── Screenshot counter at RAM[0x7000] ──
LDI r4, 0x7000
LDI r16, 0
STORE r4, r16

; ── Main loop ──
main_loop:
    IKEY r8
    ; S key = save screenshot
    LDI r20, 83
    CMP r8, r20
    JZ r11, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r8, r20
    JZ r11, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r1
    ; Increment counter
    LDI r4, 0x7000
    LOAD r16, r4
    ADD r16, r6
    STORE r4, r16
    LDI r7, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r7, r20
    JZ r11, do_frame
    ; Draw saved indicator
    LDI r11, 220
    LDI r1, 2
    LDI r2, 34
    LDI r3, 10
    LDI r9, 0x00CC00
    RECTF r11, r1, r2, r3, r9
    SUB r7, r6
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
    LDI r5, 118       ; 'v'
    STORE r1, r5
    ADD r1, r6
    LDI r5, 105       ; 'i'
    STORE r1, r5
    ADD r1, r6
    LDI r5, 101       ; 'e'
    STORE r1, r5
    ADD r1, r6
    LDI r5, 119       ; 'w'
    STORE r1, r5
    ADD r1, r6
    LDI r5, 95        ; '_'
    STORE r1, r5
    ADD r1, r6
    ; Append counter as digit
    LDI r4, 0x7000
    LOAD r16, r4
    LDI r5, 48
    ADD r5, r16
    STORE r1, r5
    ADD r1, r6
    LDI r5, 46        ; '.'
    STORE r1, r5
    ADD r1, r6
    LDI r5, 105       ; 'i'
    STORE r1, r5
    ADD r1, r6
    LDI r5, 109       ; 'm'
    STORE r1, r5
    ADD r1, r6
    LDI r5, 103       ; 'g'
    STORE r1, r5
    ADD r1, r6
    LDI r5, 0
    STORE r1, r5
    LDI r1, 0x2000
    POP r31
    RET
