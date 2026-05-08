; DESCRIPTION: This GeOS assembly code initializes a screen with a demo pattern consisting of colored rectangles. It captures screenshots when the 'S' key is pressed and saves them to the VFS with names formatted as "shot_N.img", where N is an incrementing counter. After capturing, it displays a green indicator in the top-right corner for approximately one second before returning to the demo pattern.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r4, 0x000044
FILL r4
; Red rectangle top-left
LDI r4, 10
LDI r7, 10
LDI r3, 60
LDI r15, 40
LDI r14, 0xFF0000
RECTF r4, r7, r3, r15, r14
; Green rectangle top-right
LDI r4, 180
LDI r7, 10
LDI r3, 60
LDI r15, 40
LDI r14, 0x00FF00
RECTF r4, r7, r3, r15, r14
; Yellow rectangle center
LDI r4, 100
LDI r7, 100
LDI r3, 56
LDI r15, 56
LDI r14, 0xFFFF00
RECTF r4, r7, r3, r15, r14

; ── Screenshot counter in RAM[0x7000] ──
LDI r11, 1
LDI r8, 0x7000
LDI r16, 0
STORE r8, r16

; ── Overlay timer in r1 ──
LDI r1, 0

; ── Main loop ──
main_loop:
    IKEY r12           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r12, r20
    JZ r4, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r7 (set by write_filename)
    SCRSHOT r7

    ; Increment shot counter
    LDI r8, 0x7000
    LOAD r16, r8
    ADD r16, r11
    STORE r8, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r1, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r1, r20
    JZ r4, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r4, 230
    LDI r7, 2
    LDI r3, 24
    LDI r15, 8
    LDI r14, 0x00FF00
    RECTF r4, r7, r3, r15, r14
    SUB r1, r11         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r1, r20
    JNZ r4, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r4, 230
    LDI r7, 2
    LDI r3, 24
    LDI r15, 8
    LDI r14, 0x000044
    RECTF r4, r7, r3, r15, r14

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r7, 0x2000
    ; "shot_"
    LDI r10, 115       ; 's'
    STORE r7, r10
    ADD r7, r11
    LDI r10, 104       ; 'h'
    STORE r7, r10
    ADD r7, r11
    LDI r10, 111       ; 'o'
    STORE r7, r10
    ADD r7, r11
    LDI r10, 116       ; 't'
    STORE r7, r10
    ADD r7, r11
    LDI r10, 95        ; '_'
    STORE r7, r10
    ADD r7, r11
    ; Append shot counter as digit
    LDI r8, 0x7000
    LOAD r16, r8
    LDI r10, 48         ; '0'
    ADD r10, r16
    STORE r7, r10
    ADD r7, r11
    ; ".img"
    LDI r10, 46         ; '.'
    STORE r7, r10
    ADD r7, r11
    LDI r10, 105        ; 'i'
    STORE r7, r10
    ADD r7, r11
    LDI r10, 109        ; 'm'
    STORE r7, r10
    ADD r7, r11
    LDI r10, 103        ; 'g'
    STORE r7, r10
    ADD r7, r11
    LDI r10, 0          ; null terminator
    STORE r7, r10
    ; Restore r7 to point to start of filename
    LDI r7, 0x2000
    POP r31
    RET
