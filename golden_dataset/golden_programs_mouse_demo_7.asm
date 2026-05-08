; DESCRIPTION: A red object centered at the screen with fixed size.

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
LDI r14, 0       ; y = 0
LDI r8, 1        ; increment
LDI r6, 256      ; screen width/height limit
y_loop:
  LDI r12, 0      ; x = 0
  x_loop:
    MOV r10, r14
    SHL r10, r8    ; r10 = y * 2 (blue gradient)
    PSETI r12, r14, r10
    ADD r12, r8
    CMP r12, r6
    BLT r0, x_loop
  ADD r14, r8
  CMP r14, r6
  BLT r0, y_loop

; ── Draw title text ──
LDI r0, 0x00FF00
LDI r8, 10       ; x
LDI r12, 5        ; y
TEXTI r8, r12, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r3       ; r3=mouse_x, r7=mouse_y, r6=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r0, 0xFF0000
  LDI r10, 4       ; width counter
  LDI r11, 0       ; offset
  draw_h:
    PSET r3, r11, r0
    ADD r11, r8
    CMP r11, r10
    BLT r0, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r11, 0
  draw_v:
    PSET r11, r7, r0
    ADD r11, r8
    CMP r11, r10
    BLT r0, draw_v

  ; Yellow dot if button pressed
  CMP r6, r8      ; button >= 1?
  BLT r0, no_click
  LDI r0, 0xFFFF00
  ADD r10, r3
  ADD r10, r8
  ADD r10, r8      ; r10 = mouse_x + 2
  PSET r10, r7, r0
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
