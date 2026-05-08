; DESCRIPTION: A colored object centered at the screen with fixed size.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r13, 1
LDI r10, 0          ; overlay timer
LDI r9, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r3, 0          ; y = 0
dg_y:
    LDI r14, 0         ; x = 0
dg_x:
    MOV r5, r14
    LDI r15, 16
    SHL r5, r15        ; R = x << 16
    MOV r11, r3
    LDI r15, 8
    SHL r11, r15        ; G = y << 8
    OR r5, r11
    LDI r11, 128
    OR r5, r11         ; B = 128
    PSET r14, r3, r5
    ADD r14, r13
    LDI r15, 0
    ADD r15, r14
    SUB r15, r9
    JZ r15, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r3, r13
    LDI r15, 0
    ADD r15, r3
    SUB r15, r9
    JZ r15, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r3, 0
LDI r8, 0
LDI r12, 256
LDI r7, 14
LDI r0, 0x222222
RECTF r3, r8, r12, r7, r0

; Highlight bar
LDI r3, 2
LDI r8, 2
LDI r12, 100
LDI r7, 10
LDI r0, 0x8888FF
RECTF r3, r8, r12, r7, r0

; Status bar at bottom
LDI r3, 0
LDI r8, 244
LDI r12, 256
LDI r7, 12
LDI r0, 0x222222
RECTF r3, r8, r12, r7, r0

; ── Screenshot counter at RAM[0x7000] ──
LDI r6, 0x7000
LDI r16, 0
STORE r6, r16

; ── Main loop ──
main_loop:
    IKEY r14
    ; S key = save screenshot
    LDI r20, 83
    CMP r14, r20
    JZ r3, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r14, r20
    JZ r3, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r8
    ; Increment counter
    LDI r6, 0x7000
    LOAD r16, r6
    ADD r16, r13
    STORE r6, r16
    LDI r10, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r10, r20
    JZ r3, do_frame
    ; Draw saved indicator
    LDI r3, 220
    LDI r8, 2
    LDI r12, 34
    LDI r7, 10
    LDI r0, 0x00CC00
    RECTF r3, r8, r12, r7, r0
    SUB r10, r13
    JMP do_frame

do_quit:
    HALT

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "view_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r8, 0x2000
    LDI r15, 118       ; 'v'
    STORE r8, r15
    ADD r8, r13
    LDI r15, 105       ; 'i'
    STORE r8, r15
    ADD r8, r13
    LDI r15, 101       ; 'e'
    STORE r8, r15
    ADD r8, r13
    LDI r15, 119       ; 'w'
    STORE r8, r15
    ADD r8, r13
    LDI r15, 95        ; '_'
    STORE r8, r15
    ADD r8, r13
    ; Append counter as digit
    LDI r6, 0x7000
    LOAD r16, r6
    LDI r15, 48
    ADD r15, r16
    STORE r8, r15
    ADD r8, r13
    LDI r15, 46        ; '.'
    STORE r8, r15
    ADD r8, r13
    LDI r15, 105       ; 'i'
    STORE r8, r15
    ADD r8, r13
    LDI r15, 109       ; 'm'
    STORE r8, r15
    ADD r8, r13
    LDI r15, 103       ; 'g'
    STORE r8, r15
    ADD r8, r13
    LDI r15, 0
    STORE r8, r15
    LDI r8, 0x2000
    POP r31
    RET
