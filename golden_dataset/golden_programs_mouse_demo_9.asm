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
LDI r15, 0       ; y = 0
LDI r14, 1        ; increment
LDI r7, 256      ; screen width/height limit
y_loop:
  LDI r6, 0      ; x = 0
  x_loop:
    MOV r8, r15
    SHL r8, r14    ; r8 = y * 2 (blue gradient)
    PSETI r6, r15, r8
    ADD r6, r14
    CMP r6, r7
    BLT r10, x_loop
  ADD r15, r14
  CMP r15, r7
  BLT r10, y_loop

; ── Draw title text ──
LDI r10, 0x00FF00
LDI r14, 10       ; x
LDI r6, 5        ; y
TEXTI r14, r6, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r0       ; r0=mouse_x, r13=mouse_y, r7=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r10, 0xFF0000
  LDI r8, 4       ; width counter
  LDI r1, 0       ; offset
  draw_h:
    PSET r0, r1, r10
    ADD r1, r14
    CMP r1, r8
    BLT r10, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r1, 0
  draw_v:
    PSET r1, r13, r10
    ADD r1, r14
    CMP r1, r8
    BLT r10, draw_v

  ; Yellow dot if button pressed
  CMP r7, r14      ; button >= 1?
  BLT r10, no_click
  LDI r10, 0xFFFF00
  ADD r8, r0
  ADD r8, r14
  ADD r8, r14      ; r8 = mouse_x + 2
  PSET r8, r13, r10
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
