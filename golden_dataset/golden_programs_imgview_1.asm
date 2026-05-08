; DESCRIPTION: This GeOS assembly code generates a gradient pattern simulating an image on the screen, draws a UI with a title bar and status bar, and enters a main loop where it handles user input to save screenshots or quit. It uses registers for drawing and managing state, and includes functions for writing filenames and capturing screenshots.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r11, 1
LDI r15, 0          ; overlay timer
LDI r0, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r2, 0          ; y = 0
dg_y:
    LDI r13, 0         ; x = 0
dg_x:
    MOV r9, r13
    LDI r4, 16
    SHL r9, r4        ; R = x << 16
    MOV r6, r2
    LDI r4, 8
    SHL r6, r4        ; G = y << 8
    OR r9, r6
    LDI r6, 128
    OR r9, r6         ; B = 128
    PSET r13, r2, r9
    ADD r13, r11
    LDI r4, 0
    ADD r4, r13
    SUB r4, r0
    JZ r4, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r2, r11
    LDI r4, 0
    ADD r4, r2
    SUB r4, r0
    JZ r4, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r2, 0
LDI r1, 0
LDI r12, 256
LDI r14, 14
LDI r7, 0x222222
RECTF r2, r1, r12, r14, r7

; Highlight bar
LDI r2, 2
LDI r1, 2
LDI r12, 100
LDI r14, 10
LDI r7, 0x8888FF
RECTF r2, r1, r12, r14, r7

; Status bar at bottom
LDI r2, 0
LDI r1, 244
LDI r12, 256
LDI r14, 12
LDI r7, 0x222222
RECTF r2, r1, r12, r14, r7

; ── Screenshot counter at RAM[0x7000] ──
LDI r3, 0x7000
LDI r16, 0
STORE r3, r16

; ── Main loop ──
main_loop:
    IKEY r13
    ; S key = save screenshot
    LDI r20, 83
    CMP r13, r20
    JZ r2, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r13, r20
    JZ r2, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r1
    ; Increment counter
    LDI r3, 0x7000
    LOAD r16, r3
    ADD r16, r11
    STORE r3, r16
    LDI r15, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r15, r20
    JZ r2, do_frame
    ; Draw saved indicator
    LDI r2, 220
    LDI r1, 2
    LDI r12, 34
    LDI r14, 10
    LDI r7, 0x00CC00
    RECTF r2, r1, r12, r14, r7
    SUB r15, r11
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
    LDI r4, 118       ; 'v'
    STORE r1, r4
    ADD r1, r11
    LDI r4, 105       ; 'i'
    STORE r1, r4
    ADD r1, r11
    LDI r4, 101       ; 'e'
    STORE r1, r4
    ADD r1, r11
    LDI r4, 119       ; 'w'
    STORE r1, r4
    ADD r1, r11
    LDI r4, 95        ; '_'
    STORE r1, r4
    ADD r1, r11
    ; Append counter as digit
    LDI r3, 0x7000
    LOAD r16, r3
    LDI r4, 48
    ADD r4, r16
    STORE r1, r4
    ADD r1, r11
    LDI r4, 46        ; '.'
    STORE r1, r4
    ADD r1, r11
    LDI r4, 105       ; 'i'
    STORE r1, r4
    ADD r1, r11
    LDI r4, 109       ; 'm'
    STORE r1, r4
    ADD r1, r11
    LDI r4, 103       ; 'g'
    STORE r1, r4
    ADD r1, r11
    LDI r4, 0
    STORE r1, r4
    LDI r1, 0x2000
    POP r31
    RET
