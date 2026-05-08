; DESCRIPTION: Render a red rectangle at the screen.

; screenshot.asm -- Screenshot capture utility
;
; Press S to capture a screenshot, saves to VFS as "shot_N.img".
; Shows a green indicator in top-right corner for ~1 second after capture.
; The screen starts with a demo pattern (colored rectangles).

; ── Draw demo pattern first ──
; Blue background
LDI r6, 0x000044
FILL r6
; Red rectangle top-left
LDI r6, 10
LDI r2, 10
LDI r12, 60
LDI r1, 40
LDI r4, 0xFF0000
RECTF r6, r2, r12, r1, r4
; Green rectangle top-right
LDI r6, 180
LDI r2, 10
LDI r12, 60
LDI r1, 40
LDI r4, 0x00FF00
RECTF r6, r2, r12, r1, r4
; Yellow rectangle center
LDI r6, 100
LDI r2, 100
LDI r12, 56
LDI r1, 56
LDI r4, 0xFFFF00
RECTF r6, r2, r12, r1, r4

; ── Screenshot counter in RAM[0x7000] ──
LDI r7, 1
LDI r3, 0x7000
LDI r16, 0
STORE r3, r16

; ── Overlay timer in r11 ──
LDI r11, 0

; ── Main loop ──
main_loop:
    IKEY r9           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r9, r20
    JZ r6, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r2 (set by write_filename)
    SCRSHOT r2

    ; Increment shot counter
    LDI r3, 0x7000
    LOAD r16, r3
    ADD r16, r7
    STORE r3, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r11, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r11, r20
    JZ r6, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r6, 230
    LDI r2, 2
    LDI r12, 24
    LDI r1, 8
    LDI r4, 0x00FF00
    RECTF r6, r2, r12, r1, r4
    SUB r11, r7         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r11, r20
    JNZ r6, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r6, 230
    LDI r2, 2
    LDI r12, 24
    LDI r1, 8
    LDI r4, 0x000044
    RECTF r6, r2, r12, r1, r4

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r2, 0x2000
    ; "shot_"
    LDI r8, 115       ; 's'
    STORE r2, r8
    ADD r2, r7
    LDI r8, 104       ; 'h'
    STORE r2, r8
    ADD r2, r7
    LDI r8, 111       ; 'o'
    STORE r2, r8
    ADD r2, r7
    LDI r8, 116       ; 't'
    STORE r2, r8
    ADD r2, r7
    LDI r8, 95        ; '_'
    STORE r2, r8
    ADD r2, r7
    ; Append shot counter as digit
    LDI r3, 0x7000
    LOAD r16, r3
    LDI r8, 48         ; '0'
    ADD r8, r16
    STORE r2, r8
    ADD r2, r7
    ; ".img"
    LDI r8, 46         ; '.'
    STORE r2, r8
    ADD r2, r7
    LDI r8, 105        ; 'i'
    STORE r2, r8
    ADD r2, r7
    LDI r8, 109        ; 'm'
    STORE r2, r8
    ADD r2, r7
    LDI r8, 103        ; 'g'
    STORE r2, r8
    ADD r2, r7
    LDI r8, 0          ; null terminator
    STORE r2, r8
    ; Restore r2 to point to start of filename
    LDI r2, 0x2000
    POP r31
    RET
