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
LDI r2, 0       ; y = 0
LDI r14, 1        ; increment
LDI r1, 256      ; screen width/height limit
y_loop:
  LDI r8, 0      ; x = 0
  x_loop:
    MOV r7, r2
    SHL r7, r14    ; r7 = y * 2 (blue gradient)
    PSETI r8, r2, r7
    ADD r8, r14
    CMP r8, r1
    BLT r12, x_loop
  ADD r2, r14
  CMP r2, r1
  BLT r12, y_loop

; ── Draw title text ──
LDI r12, 0x00FF00
LDI r14, 10       ; x
LDI r8, 5        ; y
TEXTI r14, r8, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r5       ; r5=mouse_x, r13=mouse_y, r1=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r12, 0xFF0000
  LDI r7, 4       ; width counter
  LDI r15, 0       ; offset
  draw_h:
    PSET r5, r15, r12
    ADD r15, r14
    CMP r15, r7
    BLT r12, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r15, 0
  draw_v:
    PSET r15, r13, r12
    ADD r15, r14
    CMP r15, r7
    BLT r12, draw_v

  ; Yellow dot if button pressed
  CMP r1, r14      ; button >= 1?
  BLT r12, no_click
  LDI r12, 0xFFFF00
  ADD r7, r5
  ADD r7, r14
  ADD r7, r14      ; r7 = mouse_x + 2
  PSET r7, r13, r12
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
