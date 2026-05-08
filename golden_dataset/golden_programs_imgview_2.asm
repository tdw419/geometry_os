; DESCRIPTION: This GeOS assembly code generates a gradient pattern simulating an image on the screen, draws a UI with a title bar and status bar, and enters a main loop where it handles user input to save screenshots or quit. It uses registers for drawing and managing state, and includes functions for writing filenames and capturing screenshots.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r4, 1
LDI r9, 0          ; overlay timer
LDI r3, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r2, 0          ; y = 0
dg_y:
    LDI r0, 0         ; x = 0
dg_x:
    MOV r12, r0
    LDI r6, 16
    SHL r12, r6        ; R = x << 16
    MOV r13, r2
    LDI r6, 8
    SHL r13, r6        ; G = y << 8
    OR r12, r13
    LDI r13, 128
    OR r12, r13         ; B = 128
    PSET r0, r2, r12
    ADD r0, r4
    LDI r6, 0
    ADD r6, r0
    SUB r6, r3
    JZ r6, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r2, r4
    LDI r6, 0
    ADD r6, r2
    SUB r6, r3
    JZ r6, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r2, 0
LDI r10, 0
LDI r15, 256
LDI r11, 14
LDI r8, 0x222222
RECTF r2, r10, r15, r11, r8

; Highlight bar
LDI r2, 2
LDI r10, 2
LDI r15, 100
LDI r11, 10
LDI r8, 0x8888FF
RECTF r2, r10, r15, r11, r8

; Status bar at bottom
LDI r2, 0
LDI r10, 244
LDI r15, 256
LDI r11, 12
LDI r8, 0x222222
RECTF r2, r10, r15, r11, r8

; ── Screenshot counter at RAM[0x7000] ──
LDI r1, 0x7000
LDI r16, 0
STORE r1, r16

; ── Main loop ──
main_loop:
    IKEY r0
    ; S key = save screenshot
    LDI r20, 83
    CMP r0, r20
    JZ r2, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r0, r20
    JZ r2, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r10
    ; Increment counter
    LDI r1, 0x7000
    LOAD r16, r1
    ADD r16, r4
    STORE r1, r16
    LDI r9, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r9, r20
    JZ r2, do_frame
    ; Draw saved indicator
    LDI r2, 220
    LDI r10, 2
    LDI r15, 34
    LDI r11, 10
    LDI r8, 0x00CC00
    RECTF r2, r10, r15, r11, r8
    SUB r9, r4
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r10, 0x2000
    LDI r6, 118       ; 'v'
    STORE r10, r6
    ADD r10, r4
    LDI r6, 105       ; 'i'
    STORE r10, r6
    ADD r10, r4
    LDI r6, 101       ; 'e'
    STORE r10, r6
    ADD r10, r4
    LDI r6, 119       ; 'w'
    STORE r10, r6
    ADD r10, r4
    LDI r6, 95        ; '_'
    STORE r10, r6
    ADD r10, r4
    ; Append counter as digit
    LDI r1, 0x7000
    LOAD r16, r1
    LDI r6, 48
    ADD r6, r16
    STORE r10, r6
    ADD r10, r4
    LDI r6, 46        ; '.'
    STORE r10, r6
    ADD r10, r4
    LDI r6, 105       ; 'i'
    STORE r10, r6
    ADD r10, r4
    LDI r6, 109       ; 'm'
    STORE r10, r6
    ADD r10, r4
    LDI r6, 103       ; 'g'
    STORE r10, r6
    ADD r10, r4
    LDI r6, 0
    STORE r10, r6
    LDI r10, 0x2000
    POP r31
    RET
