; DESCRIPTION: This GeOS assembly code generates a gradient pattern simulating an image on the screen, draws a UI with a title bar and status bar, and enters a main loop where it handles user input to save screenshots or quit. It uses registers for drawing and managing state, and includes functions for writing filenames and capturing screenshots.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r2, 1
LDI r15, 0          ; overlay timer
LDI r10, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r5, 0          ; y = 0
dg_y:
    LDI r9, 0         ; x = 0
dg_x:
    MOV r6, r9
    LDI r8, 16
    SHL r6, r8        ; R = x << 16
    MOV r12, r5
    LDI r8, 8
    SHL r12, r8        ; G = y << 8
    OR r6, r12
    LDI r12, 128
    OR r6, r12         ; B = 128
    PSET r9, r5, r6
    ADD r9, r2
    LDI r8, 0
    ADD r8, r9
    SUB r8, r10
    JZ r8, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r5, r2
    LDI r8, 0
    ADD r8, r5
    SUB r8, r10
    JZ r8, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r5, 0
LDI r14, 0
LDI r4, 256
LDI r11, 14
LDI r1, 0x222222
RECTF r5, r14, r4, r11, r1

; Highlight bar
LDI r5, 2
LDI r14, 2
LDI r4, 100
LDI r11, 10
LDI r1, 0x8888FF
RECTF r5, r14, r4, r11, r1

; Status bar at bottom
LDI r5, 0
LDI r14, 244
LDI r4, 256
LDI r11, 12
LDI r1, 0x222222
RECTF r5, r14, r4, r11, r1

; ── Screenshot counter at RAM[0x7000] ──
LDI r3, 0x7000
LDI r16, 0
STORE r3, r16

; ── Main loop ──
main_loop:
    IKEY r9
    ; S key = save screenshot
    LDI r20, 83
    CMP r9, r20
    JZ r5, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r9, r20
    JZ r5, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r14
    ; Increment counter
    LDI r3, 0x7000
    LOAD r16, r3
    ADD r16, r2
    STORE r3, r16
    LDI r15, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r15, r20
    JZ r5, do_frame
    ; Draw saved indicator
    LDI r5, 220
    LDI r14, 2
    LDI r4, 34
    LDI r11, 10
    LDI r1, 0x00CC00
    RECTF r5, r14, r4, r11, r1
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
    LDI r14, 0x2000
    LDI r8, 118       ; 'v'
    STORE r14, r8
    ADD r14, r2
    LDI r8, 105       ; 'i'
    STORE r14, r8
    ADD r14, r2
    LDI r8, 101       ; 'e'
    STORE r14, r8
    ADD r14, r2
    LDI r8, 119       ; 'w'
    STORE r14, r8
    ADD r14, r2
    LDI r8, 95        ; '_'
    STORE r14, r8
    ADD r14, r2
    ; Append counter as digit
    LDI r3, 0x7000
    LOAD r16, r3
    LDI r8, 48
    ADD r8, r16
    STORE r14, r8
    ADD r14, r2
    LDI r8, 46        ; '.'
    STORE r14, r8
    ADD r14, r2
    LDI r8, 105       ; 'i'
    STORE r14, r8
    ADD r14, r2
    LDI r8, 109       ; 'm'
    STORE r14, r8
    ADD r14, r2
    LDI r8, 103       ; 'g'
    STORE r14, r8
    ADD r14, r2
    LDI r8, 0
    STORE r14, r8
    LDI r14, 0x2000
    POP r31
    RET
