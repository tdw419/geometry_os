; DESCRIPTION: Render a red object at the screen.

; Mouse Support Demo - Phase 217
; Demonstrates MOUSEQ and IMOUSE opcodes for GUI programs
;
; MOUSEQ rd: reads mouse_x -> rd, mouse_y -> rd+1, button -> rd+2
;   button: 0=none, 1=left down, 2=left click (auto-cleared)
; IMOUSE rd: reads next event from ring buffer
;   rd = packed event (bits[7:0]=type, bits[15:8]=button)
;   rd+1 = full X, rd+2 = full Y
;   returns 0 in all if no event pending
;
; Usage: Run this program, then inject mouse events via host API
; push_mouse(x, y) and push_mouse_button(button)

; ── Draw blue gradient background ──
LDI r0, 0       ; y = 0
LDI r1, 1        ; increment
LDI r2, 256      ; screen width/height limit
y_loop:
  LDI r4, 0      ; x = 0
  x_loop:
    MOV r11, r0
    SHL r11, r1    ; r11 = y * 2 (blue gradient)
    PSETI r4, r0, r11
    ADD r4, r1
    CMP r4, r2
    BLT r5, x_loop
  ADD r0, r1
  CMP r0, r2
  BLT r5, y_loop

; ── Draw title text ──
LDI r5, 0x00FF00
LDI r1, 10       ; x
LDI r4, 5        ; y
TEXTI r1, r4, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r3       ; r3=mouse_x, r12=mouse_y, r2=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r5, 0xFF0000
  LDI r11, 4       ; width counter
  LDI r6, 0       ; offset
  draw_h:
    PSET r3, r6, r5
    ADD r6, r1
    CMP r6, r11
    BLT r5, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r6, 0
  draw_v:
    PSET r6, r12, r5
    ADD r6, r1
    CMP r6, r11
    BLT r5, draw_v

  ; Yellow dot if button pressed
  CMP r2, r1      ; button >= 1?
  BLT r5, no_click
  LDI r5, 0xFFFF00
  ADD r11, r3
  ADD r11, r1
  ADD r11, r1      ; r11 = mouse_x + 2
  PSET r11, r12, r5
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
