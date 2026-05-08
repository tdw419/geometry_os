; DESCRIPTION: A red rectangle centered at the screen with fixed size.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r3, 0x000044
FILL r3
; Red rectangle top-left
LDI r3, 10
LDI r2, 10
LDI r12, 60
LDI r15, 40
LDI r9, 0xFF0000
RECTF r3, r2, r12, r15, r9
; Green rectangle top-right
LDI r3, 180
LDI r2, 10
LDI r12, 60
LDI r15, 40
LDI r9, 0x00FF00
RECTF r3, r2, r12, r15, r9
; Yellow rectangle center
LDI r3, 100
LDI r2, 100
LDI r12, 56
LDI r15, 56
LDI r9, 0xFFFF00
RECTF r3, r2, r12, r15, r9

; ── Screenshot counter in RAM[0x7000] ──
LDI r14, 1
LDI r1, 0x7000
LDI r16, 0
STORE r1, r16

; ── Overlay timer in r8 ──
LDI r8, 0

; ── Main loop ──
main_loop:
    IKEY r4           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r4, r20
    JZ r3, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r2 (set by write_filename)
    SCRSHOT r2

    ; Increment shot counter
    LDI r1, 0x7000
    LOAD r16, r1
    ADD r16, r14
    STORE r1, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r8, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r8, r20
    JZ r3, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r3, 230
    LDI r2, 2
    LDI r12, 24
    LDI r15, 8
    LDI r9, 0x00FF00
    RECTF r3, r2, r12, r15, r9
    SUB r8, r14         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r8, r20
    JNZ r3, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r3, 230
    LDI r2, 2
    LDI r12, 24
    LDI r15, 8
    LDI r9, 0x000044
    RECTF r3, r2, r12, r15, r9

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r2, 0x2000
    ; "shot_"
    LDI r13, 115       ; 's'
    STORE r2, r13
    ADD r2, r14
    LDI r13, 104       ; 'h'
    STORE r2, r13
    ADD r2, r14
    LDI r13, 111       ; 'o'
    STORE r2, r13
    ADD r2, r14
    LDI r13, 116       ; 't'
    STORE r2, r13
    ADD r2, r14
    LDI r13, 95        ; '_'
    STORE r2, r13
    ADD r2, r14
    ; Append shot counter as digit
    LDI r1, 0x7000
    LOAD r16, r1
    LDI r13, 48         ; '0'
    ADD r13, r16
    STORE r2, r13
    ADD r2, r14
    ; ".img"
    LDI r13, 46         ; '.'
    STORE r2, r13
    ADD r2, r14
    LDI r13, 105        ; 'i'
    STORE r2, r13
    ADD r2, r14
    LDI r13, 109        ; 'm'
    STORE r2, r13
    ADD r2, r14
    LDI r13, 103        ; 'g'
    STORE r2, r13
    ADD r2, r14
    LDI r13, 0          ; null terminator
    STORE r2, r13
    ; Restore r2 to point to start of filename
    LDI r2, 0x2000
    POP r31
    RET
