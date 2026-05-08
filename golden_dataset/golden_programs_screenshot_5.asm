; DESCRIPTION: Geometry OS program to draw a red rectangle.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r12, 0x000044
FILL r12
; Red rectangle top-left
LDI r12, 10
LDI r2, 10
LDI r0, 60
LDI r1, 40
LDI r15, 0xFF0000
RECTF r12, r2, r0, r1, r15
; Green rectangle top-right
LDI r12, 180
LDI r2, 10
LDI r0, 60
LDI r1, 40
LDI r15, 0x00FF00
RECTF r12, r2, r0, r1, r15
; Yellow rectangle center
LDI r12, 100
LDI r2, 100
LDI r0, 56
LDI r1, 56
LDI r15, 0xFFFF00
RECTF r12, r2, r0, r1, r15

; ── Screenshot counter in RAM[0x7000] ──
LDI r11, 1
LDI r14, 0x7000
LDI r16, 0
STORE r14, r16

; ── Overlay timer in r6 ──
LDI r6, 0

; ── Main loop ──
main_loop:
    IKEY r3           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r3, r20
    JZ r12, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r2 (set by write_filename)
    SCRSHOT r2

    ; Increment shot counter
    LDI r14, 0x7000
    LOAD r16, r14
    ADD r16, r11
    STORE r14, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r6, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r6, r20
    JZ r12, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r12, 230
    LDI r2, 2
    LDI r0, 24
    LDI r1, 8
    LDI r15, 0x00FF00
    RECTF r12, r2, r0, r1, r15
    SUB r6, r11         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r6, r20
    JNZ r12, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r12, 230
    LDI r2, 2
    LDI r0, 24
    LDI r1, 8
    LDI r15, 0x000044
    RECTF r12, r2, r0, r1, r15

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r2, 0x2000
    ; "shot_"
    LDI r7, 115       ; 's'
    STORE r2, r7
    ADD r2, r11
    LDI r7, 104       ; 'h'
    STORE r2, r7
    ADD r2, r11
    LDI r7, 111       ; 'o'
    STORE r2, r7
    ADD r2, r11
    LDI r7, 116       ; 't'
    STORE r2, r7
    ADD r2, r11
    LDI r7, 95        ; '_'
    STORE r2, r7
    ADD r2, r11
    ; Append shot counter as digit
    LDI r14, 0x7000
    LOAD r16, r14
    LDI r7, 48         ; '0'
    ADD r7, r16
    STORE r2, r7
    ADD r2, r11
    ; ".img"
    LDI r7, 46         ; '.'
    STORE r2, r7
    ADD r2, r11
    LDI r7, 105        ; 'i'
    STORE r2, r7
    ADD r2, r11
    LDI r7, 109        ; 'm'
    STORE r2, r7
    ADD r2, r11
    LDI r7, 103        ; 'g'
    STORE r2, r7
    ADD r2, r11
    LDI r7, 0          ; null terminator
    STORE r2, r7
    ; Restore r2 to point to start of filename
    LDI r2, 0x2000
    POP r31
    RET
