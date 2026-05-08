; DESCRIPTION: This GeOS assembly code initializes a screen with a demo pattern consisting of colored rectangles. It captures screenshots when the 'S' key is pressed and saves them to the VFS with names formatted as "shot_N.img", where N is an incrementing counter. After capturing, it displays a green indicator in the top-right corner for approximately one second before returning to the demo pattern.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r10, 0x000044
FILL r10
; Red rectangle top-left
LDI r10, 10
LDI r4, 10
LDI r11, 60
LDI r9, 40
LDI r12, 0xFF0000
RECTF r10, r4, r11, r9, r12
; Green rectangle top-right
LDI r10, 180
LDI r4, 10
LDI r11, 60
LDI r9, 40
LDI r12, 0x00FF00
RECTF r10, r4, r11, r9, r12
; Yellow rectangle center
LDI r10, 100
LDI r4, 100
LDI r11, 56
LDI r9, 56
LDI r12, 0xFFFF00
RECTF r10, r4, r11, r9, r12

; ── Screenshot counter in RAM[0x7000] ──
LDI r7, 1
LDI r8, 0x7000
LDI r16, 0
STORE r8, r16

; ── Overlay timer in r5 ──
LDI r5, 0

; ── Main loop ──
main_loop:
    IKEY r6           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r6, r20
    JZ r10, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r4 (set by write_filename)
    SCRSHOT r4

    ; Increment shot counter
    LDI r8, 0x7000
    LOAD r16, r8
    ADD r16, r7
    STORE r8, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r5, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r5, r20
    JZ r10, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r10, 230
    LDI r4, 2
    LDI r11, 24
    LDI r9, 8
    LDI r12, 0x00FF00
    RECTF r10, r4, r11, r9, r12
    SUB r5, r7         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r5, r20
    JNZ r10, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r10, 230
    LDI r4, 2
    LDI r11, 24
    LDI r9, 8
    LDI r12, 0x000044
    RECTF r10, r4, r11, r9, r12

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r4, 0x2000
    ; "shot_"
    LDI r3, 115       ; 's'
    STORE r4, r3
    ADD r4, r7
    LDI r3, 104       ; 'h'
    STORE r4, r3
    ADD r4, r7
    LDI r3, 111       ; 'o'
    STORE r4, r3
    ADD r4, r7
    LDI r3, 116       ; 't'
    STORE r4, r3
    ADD r4, r7
    LDI r3, 95        ; '_'
    STORE r4, r3
    ADD r4, r7
    ; Append shot counter as digit
    LDI r8, 0x7000
    LOAD r16, r8
    LDI r3, 48         ; '0'
    ADD r3, r16
    STORE r4, r3
    ADD r4, r7
    ; ".img"
    LDI r3, 46         ; '.'
    STORE r4, r3
    ADD r4, r7
    LDI r3, 105        ; 'i'
    STORE r4, r3
    ADD r4, r7
    LDI r3, 109        ; 'm'
    STORE r4, r3
    ADD r4, r7
    LDI r3, 103        ; 'g'
    STORE r4, r3
    ADD r4, r7
    LDI r3, 0          ; null terminator
    STORE r4, r3
    ; Restore r4 to point to start of filename
    LDI r4, 0x2000
    POP r31
    RET
