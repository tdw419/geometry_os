; DESCRIPTION: Draws a colored object at the screen with fixed size.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r7, 1
LDI r11, 0          ; overlay timer
LDI r10, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r6, 0          ; y = 0
dg_y:
    LDI r0, 0         ; x = 0
dg_x:
    MOV r8, r0
    LDI r1, 16
    SHL r8, r1        ; R = x << 16
    MOV r2, r6
    LDI r1, 8
    SHL r2, r1        ; G = y << 8
    OR r8, r2
    LDI r2, 128
    OR r8, r2         ; B = 128
    PSET r0, r6, r8
    ADD r0, r7
    LDI r1, 0
    ADD r1, r0
    SUB r1, r10
    JZ r1, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r6, r7
    LDI r1, 0
    ADD r1, r6
    SUB r1, r10
    JZ r1, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r6, 0
LDI r3, 0
LDI r5, 256
LDI r13, 14
LDI r9, 0x222222
RECTF r6, r3, r5, r13, r9

; Highlight bar
LDI r6, 2
LDI r3, 2
LDI r5, 100
LDI r13, 10
LDI r9, 0x8888FF
RECTF r6, r3, r5, r13, r9

; Status bar at bottom
LDI r6, 0
LDI r3, 244
LDI r5, 256
LDI r13, 12
LDI r9, 0x222222
RECTF r6, r3, r5, r13, r9

; ── Screenshot counter at RAM[0x7000] ──
LDI r15, 0x7000
LDI r16, 0
STORE r15, r16

; ── Main loop ──
main_loop:
    IKEY r0
    ; S key = save screenshot
    LDI r20, 83
    CMP r0, r20
    JZ r6, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r0, r20
    JZ r6, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r3
    ; Increment counter
    LDI r15, 0x7000
    LOAD r16, r15
    ADD r16, r7
    STORE r15, r16
    LDI r11, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r11, r20
    JZ r6, do_frame
    ; Draw saved indicator
    LDI r6, 220
    LDI r3, 2
    LDI r5, 34
    LDI r13, 10
    LDI r9, 0x00CC00
    RECTF r6, r3, r5, r13, r9
    SUB r11, r7
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r3, 0x2000
    LDI r1, 118       ; 'v'
    STORE r3, r1
    ADD r3, r7
    LDI r1, 105       ; 'i'
    STORE r3, r1
    ADD r3, r7
    LDI r1, 101       ; 'e'
    STORE r3, r1
    ADD r3, r7
    LDI r1, 119       ; 'w'
    STORE r3, r1
    ADD r3, r7
    LDI r1, 95        ; '_'
    STORE r3, r1
    ADD r3, r7
    ; Append counter as digit
    LDI r15, 0x7000
    LOAD r16, r15
    LDI r1, 48
    ADD r1, r16
    STORE r3, r1
    ADD r3, r7
    LDI r1, 46        ; '.'
    STORE r3, r1
    ADD r3, r7
    LDI r1, 105       ; 'i'
    STORE r3, r1
    ADD r3, r7
    LDI r1, 109       ; 'm'
    STORE r3, r1
    ADD r3, r7
    LDI r1, 103       ; 'g'
    STORE r3, r1
    ADD r3, r7
    LDI r1, 0
    STORE r3, r1
    LDI r3, 0x2000
    POP r31
    RET
