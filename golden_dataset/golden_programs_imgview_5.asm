; DESCRIPTION: This GeOS assembly code generates a gradient pattern simulating an image on the screen, draws a UI with a title bar and status bar, and enters a main loop where it handles user input to save screenshots or quit. It uses registers for drawing and managing state, and includes functions for writing filenames and capturing screenshots.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r11, 1
LDI r13, 0          ; overlay timer
LDI r15, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r0, 0          ; y = 0
dg_y:
    LDI r9, 0         ; x = 0
dg_x:
    MOV r12, r9
    LDI r8, 16
    SHL r12, r8        ; R = x << 16
    MOV r2, r0
    LDI r8, 8
    SHL r2, r8        ; G = y << 8
    OR r12, r2
    LDI r2, 128
    OR r12, r2         ; B = 128
    PSET r9, r0, r12
    ADD r9, r11
    LDI r8, 0
    ADD r8, r9
    SUB r8, r15
    JZ r8, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r0, r11
    LDI r8, 0
    ADD r8, r0
    SUB r8, r15
    JZ r8, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r0, 0
LDI r5, 0
LDI r6, 256
LDI r10, 14
LDI r3, 0x222222
RECTF r0, r5, r6, r10, r3

; Highlight bar
LDI r0, 2
LDI r5, 2
LDI r6, 100
LDI r10, 10
LDI r3, 0x8888FF
RECTF r0, r5, r6, r10, r3

; Status bar at bottom
LDI r0, 0
LDI r5, 244
LDI r6, 256
LDI r10, 12
LDI r3, 0x222222
RECTF r0, r5, r6, r10, r3

; ── Screenshot counter at RAM[0x7000] ──
LDI r14, 0x7000
LDI r16, 0
STORE r14, r16

; ── Main loop ──
main_loop:
    IKEY r9
    ; S key = save screenshot
    LDI r20, 83
    CMP r9, r20
    JZ r0, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r9, r20
    JZ r0, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r5
    ; Increment counter
    LDI r14, 0x7000
    LOAD r16, r14
    ADD r16, r11
    STORE r14, r16
    LDI r13, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r13, r20
    JZ r0, do_frame
    ; Draw saved indicator
    LDI r0, 220
    LDI r5, 2
    LDI r6, 34
    LDI r10, 10
    LDI r3, 0x00CC00
    RECTF r0, r5, r6, r10, r3
    SUB r13, r11
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r5, 0x2000
    LDI r8, 118       ; 'v'
    STORE r5, r8
    ADD r5, r11
    LDI r8, 105       ; 'i'
    STORE r5, r8
    ADD r5, r11
    LDI r8, 101       ; 'e'
    STORE r5, r8
    ADD r5, r11
    LDI r8, 119       ; 'w'
    STORE r5, r8
    ADD r5, r11
    LDI r8, 95        ; '_'
    STORE r5, r8
    ADD r5, r11
    ; Append counter as digit
    LDI r14, 0x7000
    LOAD r16, r14
    LDI r8, 48
    ADD r8, r16
    STORE r5, r8
    ADD r5, r11
    LDI r8, 46        ; '.'
    STORE r5, r8
    ADD r5, r11
    LDI r8, 105       ; 'i'
    STORE r5, r8
    ADD r5, r11
    LDI r8, 109       ; 'm'
    STORE r5, r8
    ADD r5, r11
    LDI r8, 103       ; 'g'
    STORE r5, r8
    ADD r5, r11
    LDI r8, 0
    STORE r5, r8
    LDI r5, 0x2000
    POP r31
    RET
