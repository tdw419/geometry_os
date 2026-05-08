; DESCRIPTION: This GeOS assembly code generates a gradient pattern simulating an image on the screen, draws a UI with a title bar and status bar, and enters a main loop where it handles user input to save screenshots or quit. It uses registers for drawing and managing state, and includes functions for writing filenames and capturing screenshots.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r4, 1
LDI r3, 0          ; overlay timer
LDI r2, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r15, 0          ; y = 0
dg_y:
    LDI r9, 0         ; x = 0
dg_x:
    MOV r5, r9
    LDI r10, 16
    SHL r5, r10        ; R = x << 16
    MOV r0, r15
    LDI r10, 8
    SHL r0, r10        ; G = y << 8
    OR r5, r0
    LDI r0, 128
    OR r5, r0         ; B = 128
    PSET r9, r15, r5
    ADD r9, r4
    LDI r10, 0
    ADD r10, r9
    SUB r10, r2
    JZ r10, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r15, r4
    LDI r10, 0
    ADD r10, r15
    SUB r10, r2
    JZ r10, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r15, 0
LDI r11, 0
LDI r8, 256
LDI r1, 14
LDI r12, 0x222222
RECTF r15, r11, r8, r1, r12

; Highlight bar
LDI r15, 2
LDI r11, 2
LDI r8, 100
LDI r1, 10
LDI r12, 0x8888FF
RECTF r15, r11, r8, r1, r12

; Status bar at bottom
LDI r15, 0
LDI r11, 244
LDI r8, 256
LDI r1, 12
LDI r12, 0x222222
RECTF r15, r11, r8, r1, r12

; ── Screenshot counter at RAM[0x7000] ──
LDI r6, 0x7000
LDI r16, 0
STORE r6, r16

; ── Main loop ──
main_loop:
    IKEY r9
    ; S key = save screenshot
    LDI r20, 83
    CMP r9, r20
    JZ r15, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r9, r20
    JZ r15, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r11
    ; Increment counter
    LDI r6, 0x7000
    LOAD r16, r6
    ADD r16, r4
    STORE r6, r16
    LDI r3, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r3, r20
    JZ r15, do_frame
    ; Draw saved indicator
    LDI r15, 220
    LDI r11, 2
    LDI r8, 34
    LDI r1, 10
    LDI r12, 0x00CC00
    RECTF r15, r11, r8, r1, r12
    SUB r3, r4
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r11, 0x2000
    LDI r10, 118       ; 'v'
    STORE r11, r10
    ADD r11, r4
    LDI r10, 105       ; 'i'
    STORE r11, r10
    ADD r11, r4
    LDI r10, 101       ; 'e'
    STORE r11, r10
    ADD r11, r4
    LDI r10, 119       ; 'w'
    STORE r11, r10
    ADD r11, r4
    LDI r10, 95        ; '_'
    STORE r11, r10
    ADD r11, r4
    ; Append counter as digit
    LDI r6, 0x7000
    LOAD r16, r6
    LDI r10, 48
    ADD r10, r16
    STORE r11, r10
    ADD r11, r4
    LDI r10, 46        ; '.'
    STORE r11, r10
    ADD r11, r4
    LDI r10, 105       ; 'i'
    STORE r11, r10
    ADD r11, r4
    LDI r10, 109       ; 'm'
    STORE r11, r10
    ADD r11, r4
    LDI r10, 103       ; 'g'
    STORE r11, r10
    ADD r11, r4
    LDI r10, 0
    STORE r11, r10
    LDI r11, 0x2000
    POP r31
    RET
