; DESCRIPTION: A colored object centered at the screen with fixed size.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r6, 1
LDI r11, 0          ; overlay timer
LDI r9, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r0, 0          ; y = 0
dg_y:
    LDI r3, 0         ; x = 0
dg_x:
    MOV r5, r3
    LDI r15, 16
    SHL r5, r15        ; R = x << 16
    MOV r13, r0
    LDI r15, 8
    SHL r13, r15        ; G = y << 8
    OR r5, r13
    LDI r13, 128
    OR r5, r13         ; B = 128
    PSET r3, r0, r5
    ADD r3, r6
    LDI r15, 0
    ADD r15, r3
    SUB r15, r9
    JZ r15, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r0, r6
    LDI r15, 0
    ADD r15, r0
    SUB r15, r9
    JZ r15, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r0, 0
LDI r2, 0
LDI r4, 256
LDI r8, 14
LDI r7, 0x222222
RECTF r0, r2, r4, r8, r7

; Highlight bar
LDI r0, 2
LDI r2, 2
LDI r4, 100
LDI r8, 10
LDI r7, 0x8888FF
RECTF r0, r2, r4, r8, r7

; Status bar at bottom
LDI r0, 0
LDI r2, 244
LDI r4, 256
LDI r8, 12
LDI r7, 0x222222
RECTF r0, r2, r4, r8, r7

; ── Screenshot counter at RAM[0x7000] ──
LDI r10, 0x7000
LDI r16, 0
STORE r10, r16

; ── Main loop ──
main_loop:
    IKEY r3
    ; S key = save screenshot
    LDI r20, 83
    CMP r3, r20
    JZ r0, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r3, r20
    JZ r0, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r2
    ; Increment counter
    LDI r10, 0x7000
    LOAD r16, r10
    ADD r16, r6
    STORE r10, r16
    LDI r11, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r11, r20
    JZ r0, do_frame
    ; Draw saved indicator
    LDI r0, 220
    LDI r2, 2
    LDI r4, 34
    LDI r8, 10
    LDI r7, 0x00CC00
    RECTF r0, r2, r4, r8, r7
    SUB r11, r6
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r2, 0x2000
    LDI r15, 118       ; 'v'
    STORE r2, r15
    ADD r2, r6
    LDI r15, 105       ; 'i'
    STORE r2, r15
    ADD r2, r6
    LDI r15, 101       ; 'e'
    STORE r2, r15
    ADD r2, r6
    LDI r15, 119       ; 'w'
    STORE r2, r15
    ADD r2, r6
    LDI r15, 95        ; '_'
    STORE r2, r15
    ADD r2, r6
    ; Append counter as digit
    LDI r10, 0x7000
    LOAD r16, r10
    LDI r15, 48
    ADD r15, r16
    STORE r2, r15
    ADD r2, r6
    LDI r15, 46        ; '.'
    STORE r2, r15
    ADD r2, r6
    LDI r15, 105       ; 'i'
    STORE r2, r15
    ADD r2, r6
    LDI r15, 109       ; 'm'
    STORE r2, r15
    ADD r2, r6
    LDI r15, 103       ; 'g'
    STORE r2, r15
    ADD r2, r6
    LDI r15, 0
    STORE r2, r15
    LDI r2, 0x2000
    POP r31
    RET
