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
LDI r5, 0       ; y = 0
LDI r6, 1        ; increment
LDI r11, 256      ; screen width/height limit
y_loop:
  LDI r3, 0      ; x = 0
  x_loop:
    MOV r4, r5
    SHL r4, r6    ; r4 = y * 2 (blue gradient)
    PSETI r3, r5, r4
    ADD r3, r6
    CMP r3, r11
    BLT r7, x_loop
  ADD r5, r6
  CMP r5, r11
  BLT r7, y_loop

; ── Draw title text ──
LDI r7, 0x00FF00
LDI r6, 10       ; x
LDI r3, 5        ; y
TEXTI r6, r3, title, 10

; ── Main loop: read mouse, draw crosshair ──
main_loop:
  MOUSEQ r14       ; r14=mouse_x, r2=mouse_y, r11=button

  ; Draw red crosshair at mouse position (5px horizontal)
  LDI r7, 0xFF0000
  LDI r4, 4       ; width counter
  LDI r0, 0       ; offset
  draw_h:
    PSET r14, r0, r7
    ADD r0, r6
    CMP r0, r4
    BLT r7, draw_h

  ; Draw red crosshair vertical (5px)
  LDI r0, 0
  draw_v:
    PSET r0, r2, r7
    ADD r0, r6
    CMP r0, r4
    BLT r7, draw_v

  ; Yellow dot if button pressed
  CMP r11, r6      ; button >= 1?
  BLT r7, no_click
  LDI r7, 0xFFFF00
  ADD r4, r14
  ADD r4, r6
  ADD r4, r6      ; r4 = mouse_x + 2
  PSET r4, r2, r7
  no_click:

  FRAME
  JMP main_loop

title:
  .db "MOUSE TEST" 0
