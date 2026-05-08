; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; imgview.asm -- Image Viewer Demo
;
; Generates a gradient pattern (simulating a loaded image),
; draws UI chrome (title bar, status bar), and enters a main loop.
; Press S to save screenshot. Press Q to quit.

; ── Constants ──
LDI r6, 1
LDI r5, 0          ; overlay timer
LDI r3, 256        ; screen dimension

; ── Draw gradient pattern (simulated loaded image) ──
LDI r8, 0          ; y = 0
dg_y:
    LDI r13, 0         ; x = 0
dg_x:
    MOV r1, r13
    LDI r0, 16
    SHL r1, r0        ; R = x << 16
    MOV r14, r8
    LDI r0, 8
    SHL r14, r0        ; G = y << 8
    OR r1, r14
    LDI r14, 128
    OR r1, r14         ; B = 128
    PSET r13, r8, r1
    ADD r13, r6
    LDI r0, 0
    ADD r0, r13
    SUB r0, r3
    JZ r0, dg_next_y
    JMP dg_x
dg_next_y:
    ADD r8, r6
    LDI r0, 0
    ADD r0, r8
    SUB r0, r3
    JZ r0, dg_done
    JMP dg_y
dg_done:

; ── Draw title bar ──
LDI r8, 0
LDI r2, 0
LDI r7, 256
LDI r10, 14
LDI r9, 0x222222
RECTF r8, r2, r7, r10, r9

; Highlight bar
LDI r8, 2
LDI r2, 2
LDI r7, 100
LDI r10, 10
LDI r9, 0x8888FF
RECTF r8, r2, r7, r10, r9

; Status bar at bottom
LDI r8, 0
LDI r2, 244
LDI r7, 256
LDI r10, 12
LDI r9, 0x222222
RECTF r8, r2, r7, r10, r9

; ── Screenshot counter at RAM[0x7000] ──
LDI r15, 0x7000
LDI r16, 0
STORE r15, r16

; ── Main loop ──
main_loop:
    IKEY r13
    ; S key = save screenshot
    LDI r20, 83
    CMP r13, r20
    JZ r8, do_save
    ; Q key = quit
    LDI r20, 81
    CMP r13, r20
    JZ r8, do_quit
    JMP check_overlay

do_save:
    CALL write_filename
    SCRSHOT r2
    ; Increment counter
    LDI r15, 0x7000
    LOAD r16, r15
    ADD r16, r6
    STORE r15, r16
    LDI r5, 60
    JMP check_overlay

check_overlay:
    LDI r20, 0
    CMP r5, r20
    JZ r8, do_frame
    ; Draw saved indicator
    LDI r8, 220
    LDI r2, 2
    LDI r7, 34
    LDI r10, 10
    LDI r9, 0x00CC00
    RECTF r8, r2, r7, r10, r9
    SUB r5, r6
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
    LDI r0, 118       ; 'v'
    STORE r2, r0
    ADD r2, r6
    LDI r0, 105       ; 'i'
    STORE r2, r0
    ADD r2, r6
    LDI r0, 101       ; 'e'
    STORE r2, r0
    ADD r2, r6
    LDI r0, 119       ; 'w'
    STORE r2, r0
    ADD r2, r6
    LDI r0, 95        ; '_'
    STORE r2, r0
    ADD r2, r6
    ; Append counter as digit
    LDI r15, 0x7000
    LOAD r16, r15
    LDI r0, 48
    ADD r0, r16
    STORE r2, r0
    ADD r2, r6
    LDI r0, 46        ; '.'
    STORE r2, r0
    ADD r2, r6
    LDI r0, 105       ; 'i'
    STORE r2, r0
    ADD r2, r6
    LDI r0, 109       ; 'm'
    STORE r2, r0
    ADD r2, r6
    LDI r0, 103       ; 'g'
    STORE r2, r0
    ADD r2, r6
    LDI r0, 0
    STORE r2, r0
    LDI r2, 0x2000
    POP r31
    RET
