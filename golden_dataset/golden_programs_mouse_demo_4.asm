; DESCRIPTION: This GeOS assembly code demonstrates mouse support by drawing a blue gradient background and displaying "MOUSE TEST" in green. It continuously reads mouse coordinates and button status using the `MOUSEQ` opcode, then draws a red crosshair at the mouse position. If a button is pressed, it additionally draws a yellow dot at the cursor location. The program runs in an infinite loop, updating the display with each frame.

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
LDI r1, 0       ; y = 0
LDI r4, 1        ; increment
LDI r3, 256      ; screen width/height limit
y_loop:
  LDI r13, 0      ; x = 0
  x_loop:
    MOV r10, r1
    SHL r10, r4    ; r10 = y * 2 (blue gradient)
    PSETI r13, r1, r10
    ADD r13, r4
    CMP r13, r3
    BLT r6, x_loop
  ADD r1, r4
  CMP r1, r3
  BLT r6, y_loop

; ── Draw title text ──
LDI r6, 0x00FF00
LDI r4, 10       ; x
LDI r13, 5        ; y
TEXTI r4, r13, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r12       ; r12=mouse_x, r0=mouse_y, r3=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r6, 0xFF0000
  LDI r10, 4       ; width counter
  LDI r2, 0       ; offset
  draw_h:
    PSET r12, r2, r6
    ADD r2, r4
    CMP r2, r10
    BLT r6, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r2, 0
  draw_v:
    PSET r2, r0, r6
    ADD r2, r4
    CMP r2, r10
    BLT r6, draw_v

  ; Yellow dot if button pressed
  CMP r3, r4      ; button >= 1?
  BLT r6, no_click
  LDI r6, 0xFFFF00
  ADD r10, r12
  ADD r10, r4
  ADD r10, r4      ; r10 = mouse_x + 2
  PSET r10, r0, r6
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
