; DESCRIPTION: Render a colored object at the screen.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r9, 1
LDI r0, 0          ; overlay timer
LDI r2, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r4, 0          ; y = 0
dg_y:
    LDI r3, 0         ; x = 0
dg_x:
    MOV r1, r3
    LDI r12, 16
    SHL r1, r12        ; R = x << 16
    MOV r5, r4
    LDI r12, 8
    SHL r5, r12        ; G = y << 8
    OR r1, r5
    LDI r5, 128
    OR r1, r5         ; B = 128
    PSET r3, r4, r1
    ADD r3, r9
    LDI r12, 0
    ADD r12, r3
    SUB r12, r2
    JZ r12, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r4, r9
    LDI r12, 0
    ADD r12, r4
    SUB r12, r2
    JZ r12, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r4, 0
LDI r7, 0
LDI r11, 256
LDI r13, 14
LDI r14, 0x222222
RECTF r4, r7, r11, r13, r14

; Highlight bar
LDI r4, 2
LDI r7, 2
LDI r11, 100
LDI r13, 10
LDI r14, 0x8888FF
RECTF r4, r7, r11, r13, r14

; Status bar at bottom
LDI r4, 0
LDI r7, 244
LDI r11, 256
LDI r13, 12
LDI r14, 0x222222
RECTF r4, r7, r11, r13, r14

; ── Screenshot counter at RAM[0x7000] ──
LDI r6, 0x7000
LDI r16, 0
STORE r6, r16

; ── Main loop ──
main_loop:
    IKEY r3
    ; S key = save screenshot
    LDI r20, 83
    CMP r3, r20
    JZ r4, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r3, r20
    JZ r4, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r7
    ; Increment counter
    LDI r6, 0x7000
    LOAD r16, r6
    ADD r16, r9
    STORE r6, r16
    LDI r0, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r0, r20
    JZ r4, do_frame
    ; Draw saved indicator
    LDI r4, 220
    LDI r7, 2
    LDI r11, 34
    LDI r13, 10
    LDI r14, 0x00CC00
    RECTF r4, r7, r11, r13, r14
    SUB r0, r9
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r7, 0x2000
    LDI r12, 118       ; 'v'
    STORE r7, r12
    ADD r7, r9
    LDI r12, 105       ; 'i'
    STORE r7, r12
    ADD r7, r9
    LDI r12, 101       ; 'e'
    STORE r7, r12
    ADD r7, r9
    LDI r12, 119       ; 'w'
    STORE r7, r12
    ADD r7, r9
    LDI r12, 95        ; '_'
    STORE r7, r12
    ADD r7, r9
    ; Append counter as digit
    LDI r6, 0x7000
    LOAD r16, r6
    LDI r12, 48
    ADD r12, r16
    STORE r7, r12
    ADD r7, r9
    LDI r12, 46        ; '.'
    STORE r7, r12
    ADD r7, r9
    LDI r12, 105       ; 'i'
    STORE r7, r12
    ADD r7, r9
    LDI r12, 109       ; 'm'
    STORE r7, r12
    ADD r7, r9
    LDI r12, 103       ; 'g'
    STORE r7, r12
    ADD r7, r9
    LDI r12, 0
    STORE r7, r12
    LDI r7, 0x2000
    POP r31
    RET
