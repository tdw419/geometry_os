; DESCRIPTION: Render a red rectangle at the screen.

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
LDI r13, 10
LDI r3, 60
LDI r8, 40
LDI r4, 0xFF0000
RECTF r12, r13, r3, r8, r4
; Green rectangle top-right
LDI r12, 180
LDI r13, 10
LDI r3, 60
LDI r8, 40
LDI r4, 0x00FF00
RECTF r12, r13, r3, r8, r4
; Yellow rectangle center
LDI r12, 100
LDI r13, 100
LDI r3, 56
LDI r8, 56
LDI r4, 0xFFFF00
RECTF r12, r13, r3, r8, r4

; ── Screenshot counter in RAM[0x7000] ──
LDI r0, 1
LDI r14, 0x7000
LDI r16, 0
STORE r14, r16

; ── Overlay timer in r11 ──
LDI r11, 0

; ── Main loop ──
main_loop:
    IKEY r1           ; read key
    LDI r20, 83        ; 'S' key code
    CMP r1, r20
    JZ r12, do_screenshot
    JMP check_overlay

do_screenshot:
    ; Build filename "shot_N.img" in RAM at 0x2000
    CALL write_filename

    ; SCRSHOT - path addr in r13 (set by write_filename)
    SCRSHOT r13

    ; Increment shot counter
    LDI r14, 0x7000
    LOAD r16, r14
    ADD r16, r0
    STORE r14, r16

    ; Set overlay timer (60 frames ~ 1 second)
    LDI r11, 60
    JMP check_overlay

check_overlay:
    ; Show green indicator if timer > 0
    LDI r20, 0
    CMP r11, r20
    JZ r12, skip_overlay

    ; Draw green rectangle in top-right as "saved" indicator
    LDI r12, 230
    LDI r13, 2
    LDI r3, 24
    LDI r8, 8
    LDI r4, 0x00FF00
    RECTF r12, r13, r3, r8, r4
    SUB r11, r0         ; timer--

    JMP do_frame

skip_overlay:
    ; Redraw demo area where overlay was (restore blue background)
    LDI r20, 0
    CMP r11, r20
    JNZ r12, do_frame   ; still showing overlay
    ; Clear overlay area with background color
    LDI r12, 230
    LDI r13, 2
    LDI r3, 24
    LDI r8, 8
    LDI r4, 0x000044
    RECTF r12, r13, r3, r8, r4

do_frame:
    FRAME
    JMP main_loop

; ── Write filename "shot_N.img" to RAM at 0x2000 ──
write_filename:
    PUSH r31
    LDI r13, 0x2000
    ; "shot_"
    LDI r15, 115       ; 's'
    STORE r13, r15
    ADD r13, r0
    LDI r15, 104       ; 'h'
    STORE r13, r15
    ADD r13, r0
    LDI r15, 111       ; 'o'
    STORE r13, r15
    ADD r13, r0
    LDI r15, 116       ; 't'
    STORE r13, r15
    ADD r13, r0
    LDI r15, 95        ; '_'
    STORE r13, r15
    ADD r13, r0
    ; Append shot counter as digit
    LDI r14, 0x7000
    LOAD r16, r14
    LDI r15, 48         ; '0'
    ADD r15, r16
    STORE r13, r15
    ADD r13, r0
    ; ".img"
    LDI r15, 46         ; '.'
    STORE r13, r15
    ADD r13, r0
    LDI r15, 105        ; 'i'
    STORE r13, r15
    ADD r13, r0
    LDI r15, 109        ; 'm'
    STORE r13, r15
    ADD r13, r0
    LDI r15, 103        ; 'g'
    STORE r13, r15
    ADD r13, r0
    LDI r15, 0          ; null terminator
    STORE r13, r15
    ; Restore r13 to point to start of filename
    LDI r13, 0x2000
    POP r31
    RET
