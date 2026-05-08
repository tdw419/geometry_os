; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
LDI r11, 1        ; increment
LDI r14, 256      ; screen width/height limit
y_loop:
  LDI r4, 0      ; x = 0
  x_loop:
    MOV r8, r0
    SHL r8, r11    ; r8 = y * 2 (blue gradient)
    PSETI r4, r0, r8
    ADD r4, r11
    CMP r4, r14
    BLT r1, x_loop
  ADD r0, r11
  CMP r0, r14
  BLT r1, y_loop

; ── Draw title text ──
LDI r1, 0x00FF00
LDI r11, 10       ; x
LDI r4, 5        ; y
TEXTI r11, r4, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r10       ; r10=mouse_x, r3=mouse_y, r14=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r1, 0xFF0000
  LDI r8, 4       ; width counter
  LDI r9, 0       ; offset
  draw_h:
    PSET r10, r9, r1
    ADD r9, r11
    CMP r9, r8
    BLT r1, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r9, 0
  draw_v:
    PSET r9, r3, r1
    ADD r9, r11
    CMP r9, r8
    BLT r1, draw_v

  ; Yellow dot if button pressed
  CMP r14, r11      ; button >= 1?
  BLT r1, no_click
  LDI r1, 0xFFFF00
  ADD r8, r10
  ADD r8, r11
  ADD r8, r11      ; r8 = mouse_x + 2
  PSET r8, r3, r1
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
