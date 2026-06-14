; flood_demo.asm -- Interactive flood fill paint demo
; Controls: Arrow keys to move cursor, Space to fill, C to clear
; Draws a bordered region and lets you flood-fill different sections

; Helper register for increment
LDI r7, 1

; Colors
LDI r20, 0x000000    ; black
LDI r21, 0xFFFFFF    ; white
LDI r22, 0xFF0000    ; red
LDI r23, 0x00FF00    ; green
LDI r24, 0x0000FF    ; blue
LDI r25, 0xFFAA00    ; orange
LDI r26, 0xFF00FF    ; magenta
LDI r27, 0x00FFFF    ; cyan
LDI r28, 0xFFFF00    ; yellow

; Cursor position (starts at center)
LDI r10, 128         ; cursor x
LDI r11, 128         ; cursor y

; Color cycle index
LDI r12, 0

; Color palette (8 colors) stored in RAM at 0x2000-0x2007
LDI r1, 0x2000
STORE r1, r22
ADD r1, r7
STORE r1, r23
ADD r1, r7
STORE r1, r24
ADD r1, r7
STORE r1, r25
ADD r1, r7
STORE r1, r26
ADD r1, r7
STORE r1, r27
ADD r1, r7
STORE r1, r28
ADD r1, r7
STORE r1, r21

; Draw the initial scene
CALL draw_scene

; Main loop
main_loop:
  FILL r20            ; clear screen
  CALL draw_scene     ; redraw walls

  ; Draw cursor (white pixel)
  PSET r10, r11, r21

  ; Read input
  IKEY r13
  JZ r13, no_input

  ; Left arrow (37)
  LDI r14, 37
  CMP r13, r14
  JZ r0, move_left
  ; Right arrow (39)
  LDI r14, 39
  CMP r13, r14
  JZ r0, move_right
  ; Up arrow (38)
  LDI r14, 38
  CMP r13, r14
  JZ r0, move_up
  ; Down arrow (40)
  LDI r14, 40
  CMP r13, r14
  JZ r0, move_down
  ; Space (32) = flood fill
  LDI r14, 32
  CMP r13, r14
  JZ r0, do_fill
  ; C (67) = clear colors
  LDI r14, 67
  CMP r13, r14
  JZ r0, do_clear

  JMP no_input

move_left:
  LDI r14, 10
  CMP r10, r14
  BLT r0, no_input
  LDI r14, 2
  SUB r10, r14
  JMP no_input

move_right:
  LDI r14, 245
  CMP r10, r14
  BLT r0, no_input
  LDI r14, 2
  ADD r10, r14
  JMP no_input

move_up:
  LDI r14, 10
  CMP r11, r14
  BLT r0, no_input
  LDI r14, 2
  SUB r11, r14
  JMP no_input

move_down:
  LDI r14, 245
  CMP r11, r14
  BLT r0, no_input
  LDI r14, 2
  ADD r11, r14
  JMP no_input

do_fill:
  ; Get fill color from palette
  LDI r1, 0x2000
  MOV r2, r12
  ADD r1, r2
  LOAD r14, r1         ; fill color

  ; Tolerance = 0 (exact match)
  LDI r15, 0

  ; FLOOD xr, yr, fill_reg, tolerance_reg
  FLOOD r10, r11, r14, r15

  ; Cycle to next color
  LDI r14, 7
  ADD r12, r14
  LDI r14, 7
  MOD r12, r14
  JMP no_input

do_clear:
  LDI r12, 0           ; reset color index
  JMP no_input

no_input:
  FRAME
  JMP main_loop

; Draw scene: border + internal walls creating rooms
draw_scene:
  PUSH r31

  ; Temp registers for RECTF args (x, y, w, h)
  LDI r16, 0           ; x
  LDI r17, 0           ; y
  LDI r18, 256         ; w
  LDI r19, 2           ; h

  ; Top border
  RECTF r16, r17, r18, r19, r21

  ; Bottom border (y=254)
  LDI r17, 254
  RECTF r16, r17, r18, r19, r21

  ; Left border (x=0, y=0, w=2, h=256)
  LDI r16, 0
  LDI r17, 0
  LDI r18, 2
  LDI r19, 256
  RECTF r16, r17, r18, r19, r21

  ; Right border (x=254)
  LDI r16, 254
  RECTF r16, r17, r18, r19, r21

  ; Vertical divider at x=126 (w=4, h=216, y=20)
  LDI r16, 126
  LDI r17, 20
  LDI r18, 4
  LDI r19, 216
  RECTF r16, r17, r18, r19, r21

  ; Horizontal divider at y=126 (x=20, w=216, h=4)
  LDI r16, 20
  LDI r17, 126
  LDI r18, 216
  LDI r19, 4
  RECTF r16, r17, r18, r19, r21

  ; Box in top-left room (red)
  LDI r16, 40
  LDI r17, 40
  LDI r18, 40
  LDI r19, 30
  RECTF r16, r17, r18, r19, r22

  ; Box in top-right room (green)
  LDI r16, 160
  LDI r17, 50
  LDI r18, 30
  LDI r19, 40
  RECTF r16, r17, r18, r19, r23

  ; Box in bottom-left room (blue)
  LDI r16, 60
  LDI r17, 170
  LDI r18, 30
  LDI r19, 30
  RECTF r16, r17, r18, r19, r24

  ; Box in bottom-right room (orange)
  LDI r16, 180
  LDI r17, 160
  LDI r18, 30
  LDI r19, 50
  RECTF r16, r17, r18, r19, r25

  POP r31
  RET

HALT
