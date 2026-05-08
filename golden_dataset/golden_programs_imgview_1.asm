; DESCRIPTION: Display a object using color colored at the screen.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r14, 1
LDI r7, 0          ; overlay timer
LDI r9, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r11, 0          ; y = 0
dg_y:
    LDI r4, 0         ; x = 0
dg_x:
    MOV r3, r4
    LDI r6, 16
    SHL r3, r6        ; R = x << 16
    MOV r8, r11
    LDI r6, 8
    SHL r8, r6        ; G = y << 8
    OR r3, r8
    LDI r8, 128
    OR r3, r8         ; B = 128
    PSET r4, r11, r3
    ADD r4, r14
    LDI r6, 0
    ADD r6, r4
    SUB r6, r9
    JZ r6, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r11, r14
    LDI r6, 0
    ADD r6, r11
    SUB r6, r9
    JZ r6, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r11, 0
LDI r0, 0
LDI r10, 256
LDI r2, 14
LDI r1, 0x222222
RECTF r11, r0, r10, r2, r1

; Highlight bar
LDI r11, 2
LDI r0, 2
LDI r10, 100
LDI r2, 10
LDI r1, 0x8888FF
RECTF r11, r0, r10, r2, r1

; Status bar at bottom
LDI r11, 0
LDI r0, 244
LDI r10, 256
LDI r2, 12
LDI r1, 0x222222
RECTF r11, r0, r10, r2, r1

; ── Screenshot counter at RAM[0x7000] ──
LDI r12, 0x7000
LDI r16, 0
STORE r12, r16

; ── Main loop ──
main_loop:
    IKEY r4
    ; S key = save screenshot
    LDI r20, 83
    CMP r4, r20
    JZ r11, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r4, r20
    JZ r11, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r0
    ; Increment counter
    LDI r12, 0x7000
    LOAD r16, r12
    ADD r16, r14
    STORE r12, r16
    LDI r7, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r7, r20
    JZ r11, do_frame
    ; Draw saved indicator
    LDI r11, 220
    LDI r0, 2
    LDI r10, 34
    LDI r2, 10
    LDI r1, 0x00CC00
    RECTF r11, r0, r10, r2, r1
    SUB r7, r14
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r0, 0x2000
    LDI r6, 118       ; 'v'
    STORE r0, r6
    ADD r0, r14
    LDI r6, 105       ; 'i'
    STORE r0, r6
    ADD r0, r14
    LDI r6, 101       ; 'e'
    STORE r0, r6
    ADD r0, r14
    LDI r6, 119       ; 'w'
    STORE r0, r6
    ADD r0, r14
    LDI r6, 95        ; '_'
    STORE r0, r6
    ADD r0, r14
    ; Append counter as digit
    LDI r12, 0x7000
    LOAD r16, r12
    LDI r6, 48
    ADD r6, r16
    STORE r0, r6
    ADD r0, r14
    LDI r6, 46        ; '.'
    STORE r0, r6
    ADD r0, r14
    LDI r6, 105       ; 'i'
    STORE r0, r6
    ADD r0, r14
    LDI r6, 109       ; 'm'
    STORE r0, r6
    ADD r0, r14
    LDI r6, 103       ; 'g'
    STORE r0, r6
    ADD r0, r14
    LDI r6, 0
    STORE r0, r6
    LDI r0, 0x2000
    POP r31
    RET
