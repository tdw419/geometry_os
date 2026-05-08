; DESCRIPTION: This GeOS assembly code generates a gradient pattern simulating an image on the screen, draws a UI with a title bar and status bar, and enters a main loop where it handles user input to save screenshots or quit. It uses registers for drawing and managing state, and includes functions for writing filenames and capturing screenshots.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r7, 1
LDI r13, 0          ; overlay timer
LDI r5, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r14, 0          ; y = 0
dg_y:
    LDI r3, 0         ; x = 0
dg_x:
    MOV r10, r3
    LDI r12, 16
    SHL r10, r12        ; R = x << 16
    MOV r15, r14
    LDI r12, 8
    SHL r15, r12        ; G = y << 8
    OR r10, r15
    LDI r15, 128
    OR r10, r15         ; B = 128
    PSET r3, r14, r10
    ADD r3, r7
    LDI r12, 0
    ADD r12, r3
    SUB r12, r5
    JZ r12, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r14, r7
    LDI r12, 0
    ADD r12, r14
    SUB r12, r5
    JZ r12, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r14, 0
LDI r1, 0
LDI r0, 256
LDI r8, 14
LDI r9, 0x222222
RECTF r14, r1, r0, r8, r9

; Highlight bar
LDI r14, 2
LDI r1, 2
LDI r0, 100
LDI r8, 10
LDI r9, 0x8888FF
RECTF r14, r1, r0, r8, r9

; Status bar at bottom
LDI r14, 0
LDI r1, 244
LDI r0, 256
LDI r8, 12
LDI r9, 0x222222
RECTF r14, r1, r0, r8, r9

; ── Screenshot counter at RAM[0x7000] ──
LDI r11, 0x7000
LDI r16, 0
STORE r11, r16

; ── Main loop ──
main_loop:
    IKEY r3
    ; S key = save screenshot
    LDI r20, 83
    CMP r3, r20
    JZ r14, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r3, r20
    JZ r14, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r1
    ; Increment counter
    LDI r11, 0x7000
    LOAD r16, r11
    ADD r16, r7
    STORE r11, r16
    LDI r13, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r13, r20
    JZ r14, do_frame
    ; Draw saved indicator
    LDI r14, 220
    LDI r1, 2
    LDI r0, 34
    LDI r8, 10
    LDI r9, 0x00CC00
    RECTF r14, r1, r0, r8, r9
    SUB r13, r7
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
    LDI r12, 118       ; 'v'
    STORE r1, r12
    ADD r1, r7
    LDI r12, 105       ; 'i'
    STORE r1, r12
    ADD r1, r7
    LDI r12, 101       ; 'e'
    STORE r1, r12
    ADD r1, r7
    LDI r12, 119       ; 'w'
    STORE r1, r12
    ADD r1, r7
    LDI r12, 95        ; '_'
    STORE r1, r12
    ADD r1, r7
    ; Append counter as digit
    LDI r11, 0x7000
    LOAD r16, r11
    LDI r12, 48
    ADD r12, r16
    STORE r1, r12
    ADD r1, r7
    LDI r12, 46        ; '.'
    STORE r1, r12
    ADD r1, r7
    LDI r12, 105       ; 'i'
    STORE r1, r12
    ADD r1, r7
    LDI r12, 109       ; 'm'
    STORE r1, r12
    ADD r1, r7
    LDI r12, 103       ; 'g'
    STORE r1, r12
    ADD r1, r7
    LDI r12, 0
    STORE r1, r12
    LDI r1, 0x2000
    POP r31
    RET
