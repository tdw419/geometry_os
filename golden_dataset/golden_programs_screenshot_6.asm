; DESCRIPTION: A red rectangle centered at the screen with fixed size.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r2, 0x000044
FILL r2
; Red rectangle top-left
LDI r2, 10
LDI r3, 10
LDI r7, 60
LDI r5, 40
LDI r14, 0xFF0000
RECTF r2, r3, r7, r5, r14
; Green rectangle top-right
LDI r2, 180
LDI r3, 10
LDI r7, 60
LDI r5, 40
LDI r14, 0x00FF00
RECTF r2, r3, r7, r5, r14
; Yellow rectangle center
LDI r2, 100
LDI r3, 100
LDI r7, 56
LDI r5, 56
LDI r14, 0xFFFF00
RECTF r2, r3, r7, r5, r14

; ── Screenshot counter in RAM[0x7000] ──
LDI r11, 1
LDI r1, 0x7000
LDI r16, 0
STORE r1, r16

; ── Overlay timer in r13 ──
LDI r13, 0

; ── Main loop ──
main_loop:
    IKEY r12           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r12, r20
    JZ r2, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r3 (set by write_filename)
    SCRSHOT r3

    ; Increment shot counter
    LDI r1, 0x7000
    LOAD r16, r1
    ADD r16, r11
    STORE r1, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r13, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r13, r20
    JZ r2, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r2, 230
    LDI r3, 2
    LDI r7, 24
    LDI r5, 8
    LDI r14, 0x00FF00
    RECTF r2, r3, r7, r5, r14
    SUB r13, r11         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r13, r20
    JNZ r2, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r2, 230
    LDI r3, 2
    LDI r7, 24
    LDI r5, 8
    LDI r14, 0x000044
    RECTF r2, r3, r7, r5, r14

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r3, 0x2000
    ; "shot_"
    LDI r10, 115       ; 's'
    STORE r3, r10
    ADD r3, r11
    LDI r10, 104       ; 'h'
    STORE r3, r10
    ADD r3, r11
    LDI r10, 111       ; 'o'
    STORE r3, r10
    ADD r3, r11
    LDI r10, 116       ; 't'
    STORE r3, r10
    ADD r3, r11
    LDI r10, 95        ; '_'
    STORE r3, r10
    ADD r3, r11
    ; Append shot counter as digit
    LDI r1, 0x7000
    LOAD r16, r1
    LDI r10, 48         ; '0'
    ADD r10, r16
    STORE r3, r10
    ADD r3, r11
    ; ".img"
    LDI r10, 46         ; '.'
    STORE r3, r10
    ADD r3, r11
    LDI r10, 105        ; 'i'
    STORE r3, r10
    ADD r3, r11
    LDI r10, 109        ; 'm'
    STORE r3, r10
    ADD r3, r11
    LDI r10, 103        ; 'g'
    STORE r3, r10
    ADD r3, r11
    LDI r10, 0          ; null terminator
    STORE r3, r10
    ; Restore r3 to point to start of filename
    LDI r3, 0x2000
    POP r31
    RET
