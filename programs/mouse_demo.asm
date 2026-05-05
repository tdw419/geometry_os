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
LDI r10, 0       ; y = 0
LDI r1, 1        ; increment
LDI r5, 256      ; screen width/height limit
y_loop:
  LDI r2, 0      ; x = 0
  x_loop:
    MOV r6, r10
    SHL r6, r1    ; r6 = y * 2 (blue gradient)
    PSETI r2, r10, r6
    ADD r2, r1
    CMP r2, r5
    BLT r0, x_loop
  ADD r10, r1
  CMP r10, r5
  BLT r0, y_loop

; ── Draw title text ──
LDI r0, 0x00FF00
LDI r1, 10       ; x
LDI r2, 5        ; y
TEXTI r1, r2, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r3       ; r3=mouse_x, r4=mouse_y, r5=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r0, 0xFF0000
  LDI r6, 4       ; width counter
  LDI r7, 0       ; offset
  draw_h:
    PSET r3, r7, r0
    ADD r7, r1
    CMP r7, r6
    BLT r0, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r7, 0
  draw_v:
    PSET r7, r4, r0
    ADD r7, r1
    CMP r7, r6
    BLT r0, draw_v

  ; Yellow dot if button pressed
  CMP r5, r1      ; button >= 1?
  BLT r0, no_click
  LDI r0, 0xFFFF00
  ADD r6, r3
  ADD r6, r1
  ADD r6, r1      ; r6 = mouse_x + 2
  PSET r6, r4, r0
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
