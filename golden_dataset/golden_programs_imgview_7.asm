; DESCRIPTION: Display a object using color colored at the screen.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r4, 1
LDI r11, 0          ; overlay timer
LDI r10, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r2, 0          ; y = 0
dg_y:
    LDI r3, 0         ; x = 0
dg_x:
    MOV r0, r3
    LDI r12, 16
    SHL r0, r12        ; R = x << 16
    MOV r13, r2
    LDI r12, 8
    SHL r13, r12        ; G = y << 8
    OR r0, r13
    LDI r13, 128
    OR r0, r13         ; B = 128
    PSET r3, r2, r0
    ADD r3, r4
    LDI r12, 0
    ADD r12, r3
    SUB r12, r10
    JZ r12, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r2, r4
    LDI r12, 0
    ADD r12, r2
    SUB r12, r10
    JZ r12, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r2, 0
LDI r6, 0
LDI r9, 256
LDI r15, 14
LDI r1, 0x222222
RECTF r2, r6, r9, r15, r1

; Highlight bar
LDI r2, 2
LDI r6, 2
LDI r9, 100
LDI r15, 10
LDI r1, 0x8888FF
RECTF r2, r6, r9, r15, r1

; Status bar at bottom
LDI r2, 0
LDI r6, 244
LDI r9, 256
LDI r15, 12
LDI r1, 0x222222
RECTF r2, r6, r9, r15, r1

; ── Screenshot counter at RAM[0x7000] ──
LDI r7, 0x7000
LDI r16, 0
STORE r7, r16

; ── Main loop ──
main_loop:
    IKEY r3
    ; S key = save screenshot
    LDI r20, 83
    CMP r3, r20
    JZ r2, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r3, r20
    JZ r2, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r6
    ; Increment counter
    LDI r7, 0x7000
    LOAD r16, r7
    ADD r16, r4
    STORE r7, r16
    LDI r11, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r11, r20
    JZ r2, do_frame
    ; Draw saved indicator
    LDI r2, 220
    LDI r6, 2
    LDI r9, 34
    LDI r15, 10
    LDI r1, 0x00CC00
    RECTF r2, r6, r9, r15, r1
    SUB r11, r4
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r6, 0x2000
    LDI r12, 118       ; 'v'
    STORE r6, r12
    ADD r6, r4
    LDI r12, 105       ; 'i'
    STORE r6, r12
    ADD r6, r4
    LDI r12, 101       ; 'e'
    STORE r6, r12
    ADD r6, r4
    LDI r12, 119       ; 'w'
    STORE r6, r12
    ADD r6, r4
    LDI r12, 95        ; '_'
    STORE r6, r12
    ADD r6, r4
    ; Append counter as digit
    LDI r7, 0x7000
    LOAD r16, r7
    LDI r12, 48
    ADD r12, r16
    STORE r6, r12
    ADD r6, r4
    LDI r12, 46        ; '.'
    STORE r6, r12
    ADD r6, r4
    LDI r12, 105       ; 'i'
    STORE r6, r12
    ADD r6, r4
    LDI r12, 109       ; 'm'
    STORE r6, r12
    ADD r6, r4
    LDI r12, 103       ; 'g'
    STORE r6, r12
    ADD r6, r4
    LDI r12, 0
    STORE r6, r12
    LDI r6, 0x2000
    POP r31
    RET
