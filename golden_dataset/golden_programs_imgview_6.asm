; DESCRIPTION: Draws a colored object at the screen with fixed size.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r8, 1
LDI r6, 0          ; overlay timer
LDI r7, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r13, 0          ; y = 0
dg_y:
    LDI r9, 0         ; x = 0
dg_x:
    MOV r1, r9
    LDI r11, 16
    SHL r1, r11        ; R = x << 16
    MOV r12, r13
    LDI r11, 8
    SHL r12, r11        ; G = y << 8
    OR r1, r12
    LDI r12, 128
    OR r1, r12         ; B = 128
    PSET r9, r13, r1
    ADD r9, r8
    LDI r11, 0
    ADD r11, r9
    SUB r11, r7
    JZ r11, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r13, r8
    LDI r11, 0
    ADD r11, r13
    SUB r11, r7
    JZ r11, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r13, 0
LDI r4, 0
LDI r5, 256
LDI r15, 14
LDI r14, 0x222222
RECTF r13, r4, r5, r15, r14

; Highlight bar
LDI r13, 2
LDI r4, 2
LDI r5, 100
LDI r15, 10
LDI r14, 0x8888FF
RECTF r13, r4, r5, r15, r14

; Status bar at bottom
LDI r13, 0
LDI r4, 244
LDI r5, 256
LDI r15, 12
LDI r14, 0x222222
RECTF r13, r4, r5, r15, r14

; ── Screenshot counter at RAM[0x7000] ──
LDI r2, 0x7000
LDI r16, 0
STORE r2, r16

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
    SCRSHOT r4
    ; Increment counter
    LDI r2, 0x7000
    LOAD r16, r2
    ADD r16, r8
    STORE r2, r16
    LDI r6, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r6, r20
    JZ r13, do_frame
    ; Draw saved indicator
    LDI r13, 220
    LDI r4, 2
    LDI r5, 34
    LDI r15, 10
    LDI r14, 0x00CC00
    RECTF r13, r4, r5, r15, r14
    SUB r6, r8
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r4, 0x2000
    LDI r11, 118       ; 'v'
    STORE r4, r11
    ADD r4, r8
    LDI r11, 105       ; 'i'
    STORE r4, r11
    ADD r4, r8
    LDI r11, 101       ; 'e'
    STORE r4, r11
    ADD r4, r8
    LDI r11, 119       ; 'w'
    STORE r4, r11
    ADD r4, r8
    LDI r11, 95        ; '_'
    STORE r4, r11
    ADD r4, r8
    ; Append counter as digit
    LDI r2, 0x7000
    LOAD r16, r2
    LDI r11, 48
    ADD r11, r16
    STORE r4, r11
    ADD r4, r8
    LDI r11, 46        ; '.'
    STORE r4, r11
    ADD r4, r8
    LDI r11, 105       ; 'i'
    STORE r4, r11
    ADD r4, r8
    LDI r11, 109       ; 'm'
    STORE r4, r11
    ADD r4, r8
    LDI r11, 103       ; 'g'
    STORE r4, r11
    ADD r4, r8
    LDI r11, 0
    STORE r4, r11
    LDI r4, 0x2000
    POP r31
    RET
