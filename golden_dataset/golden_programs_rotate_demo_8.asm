; DESCRIPTION: Display a object using color red at the screen.

; rotate_demo.asm -- Interactive rotation and scaling demo
;
; Draws an asymmetric sprite (colored L-shape), then rotates and scales it
; using the ROTATE and SCALE opcodes. Keyboard controlled.
;
; Controls:
;   Left/Right arrows -- change rotation angle
;   Up/Down arrows    -- change scale factor
;   A/D               -- fine angle adjustment
;   R                 -- reset angle and scale
;   Q                 -- quit
;
; ROTATE opcode (0xF4): ROTATE x_reg, y_reg, w_reg, h_reg, angle_reg
;   angle_reg: fixed-point radians (value / 256.0 = radians)
;   4096 = 90 degrees (pi/2), 8192 = 180 degrees (pi)
;
; SCALE opcode (0xF5): SCALE sx_reg, sy_reg, sw_reg, sh_reg, dx_reg, dy_reg, dw_reg, dh_reg
;   Scales source rect to dest rect, nearest-neighbor sampling

; ── Register plan ──────────────────────────────────────────────
;   r5  = sprite x position (top-left of rendered area)
;   r0  = sprite y position (top-left of rendered area)
;   r8  = base sprite size (32x32)
;   r11  = current scale factor (32 = 1x, 64 = 2x, etc.)
;   r3  = angle (fixed-point radians, increments by 64 = ~14 degrees)
;   r10  = scratch
;   r7  = key code from IKEY
;   r1  = color (red)
;   r13  = 0 (black for clearing)
;   r14 = color (green)
;   r6 = color (blue)
;   r2 = color (yellow)
;   r12 = source x (sprite drawn at fixed position)
;   r9 = source y
;   r15 = dest x (scaled output position)
;   r16 = dest y

; ── init ──────────────────────────────────────────────────────
LDI r5, 0        ; sprite screen x (computed each frame)
LDI r0, 0        ; sprite screen y (computed each frame)
LDI r8, 32       ; base sprite size
LDI r11, 32       ; scale = 1x (32x32 output = 32x32 source)
LDI r3, 0        ; angle = 0
LDI r1, 0xFF0000 ; red
LDI r13, 0        ; black
LDI r14, 0x00FF00 ; green
LDI r6, 0x0000FF ; blue
LDI r2, 0xFFFF00 ; yellow
LDI r12, 0       ; source x (sprite drawn at top-left)
LDI r9, 0       ; source y

; ── main loop ──────────────────────────────────────────────────
main_loop:
  FILL r13           ; clear screen to black

  ; Draw the base sprite into the source area (0,0) to (31,31)
  ; Asymmetric L-shape so rotation is visible
  CALL draw_sprite

  ; Compute dest position: center the scaled sprite on screen
  ; dest_x = 128 - scale/2
  MOV r10, r11
  LDI r19, 2
  DIV r10, r19       ; r10 = scale / 2
  LDI r15, 128
  SUB r15, r10       ; dest_x = 128 - scale/2

  ; dest_y = 128 - scale/2
  LDI r16, 128
  SUB r16, r10       ; dest_y = 128 - scale/2

  ; Step 1: Scale the source sprite to dest area
  ; SCALE sx_reg, sy_reg, sw_reg, sh_reg, dx_reg, dy_reg, dw_reg, dh_reg
  SCALE r12, r9, r8, r8, r15, r16, r11, r11

  ; Step 2: Rotate the scaled sprite in-place
  ; ROTATE x_reg, y_reg, w_reg, h_reg, angle_reg
  ROTATE r15, r16, r11, r11, r3

  ; Draw HUD text showing angle and scale
  CALL draw_hud

  ; Read keyboard input
  IKEY r7

  ; Right arrow (or D) = increase angle
  LDI r10, 68
  CMP r7, r10
  JZ r4, angle_inc
  LDI r10, 100
  CMP r7, r10
  JZ r4, angle_inc

  ; Left arrow (or A) = decrease angle
  LDI r10, 65
  CMP r7, r10
  JZ r4, angle_dec
  LDI r10, 97
  CMP r7, r10
  JZ r4, angle_dec

  ; Up arrow = increase scale
  LDI r10, 87
  CMP r7, r10
  JZ r4, scale_up
  LDI r10, 119
  CMP r7, r10
  JZ r4, scale_up

  ; Down arrow = decrease scale
  LDI r10, 83
  CMP r7, r10
  JZ r4, scale_down
  LDI r10, 115
  CMP r7, r10
  JZ r4, scale_down

  ; R = reset
  LDI r10, 82
  CMP r7, r10
  JZ r4, do_reset
  LDI r10, 114
  CMP r7, r10
  JZ r4, do_reset

  ; Q = quit
  LDI r10, 81
  CMP r7, r10
  JZ r4, do_quit
  LDI r10, 113
  CMP r7, r10
  JZ r4, do_quit

  JMP frame_done

angle_inc:
  LDI r10, 64
  ADD r3, r10        ; +64 fixed-point (~14 degrees)
  JMP frame_done

angle_dec:
  LDI r10, 64
  SUB r3, r10        ; -64 fixed-point (~14 degrees)
  JMP frame_done

scale_up:
  LDI r10, 8
  ADD r11, r10        ; increase scale
  ; Clamp: max 128
  LDI r10, 128
  CMP r11, r10
  BLT r4, frame_done
  LDI r11, 128
  JMP frame_done

scale_down:
  LDI r10, 8
  SUB r11, r10        ; decrease scale
  ; Clamp: min 8
  LDI r10, 8
  CMP r11, r10
  BGE r4, frame_done
  LDI r11, 8
  JMP frame_done

do_reset:
  LDI r3, 0         ; angle = 0
  LDI r11, 32        ; scale = 1x
  JMP frame_done

do_quit:
  HALT

frame_done:
  FRAME
  JMP main_loop

; ── Draw asymmetric L-shape sprite at (0,0) size 32x32 ────────
; Uses colors to make rotation obvious:
;   Top-left quadrant: red
;   Top-right quadrant: green
;   Bottom-left: blue L-shape
;   Bottom-right: yellow corner triangle
draw_sprite:
  ; Top half: red (rows 0-15, cols 0-31)
  RECTF r13, r13, r8, r8, r1
  ; Actually, let's draw an asymmetric pattern:
  ; Top-left 16x16 = red
  LDI r20, 0
  LDI r21, 0
  LDI r22, 16
  LDI r23, 16
  RECTF r20, r21, r22, r23, r1

  ; Top-right 16x16 = green
  LDI r20, 16
  LDI r21, 0
  LDI r22, 16
  LDI r23, 16
  RECTF r20, r21, r22, r23, r14

  ; Bottom-left 16x16 = blue
  LDI r20, 0
  LDI r21, 16
  LDI r22, 16
  LDI r23, 16
  RECTF r20, r21, r22, r23, r6

  ; Bottom-right 16x16 = yellow
  LDI r20, 16
  LDI r21, 16
  LDI r22, 16
  LDI r23, 16
  RECTF r20, r21, r22, r23, r2

  ; Draw a white dot in top-left corner as orientation marker
  PSETI 4, 4, 0xFFFFFF
  PSETI 5, 4, 0xFFFFFF
  PSETI 4, 5, 0xFFFFFF
  PSETI 5, 5, 0xFFFFFF

  ; Draw a small cross in center
  PSETI 15, 15, 0xFFFFFF
  PSETI 16, 15, 0xFFFFFF
  PSETI 15, 16, 0xFFFFFF
  PSETI 16, 16, 0xFFFFFF

  RET

; ── Draw HUD ──────────────────────────────────────────────────
draw_hud:
  ; Write angle value as text at top of screen
  ; Store angle string at 0x2000
  LDI r20, 0x2000
  ; "ANG:" (4 chars)
  STRO r20, "ANG"
  ADD r20, r7
  STRO r20, ":"
  ADD r20, r7

  ; We can't easily convert angle to decimal in ASM,
  ; so just show a bar indicator instead.
  ; Draw angle bar at y=230 (bottom area)
  ; Bar width proportional to angle (mod 256)
  MOV r20, r3
  LDI r21, 255
  AND r20, r21       ; r20 = angle & 0xFF (0-255 range for bar)

  ; Draw bar background
  LDI r20, 0
  LDI r21, 230
  LDI r22, 256
  LDI r23, 4
  LDI r24, 0x333333
  RECTF r20, r21, r22, r23, r24

  ; Draw bar fill
  LDI r20, 0
  LDI r21, 231
  ; Width = angle & 0xFF
  MOV r22, r3
  LDI r23, 255
  AND r22, r23
  LDI r23, 2
  RECTF r20, r21, r22, r23, r14

  ; Scale indicator bar at y=236
  LDI r20, 0
  LDI r21, 236
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r24

  ; Scale bar: width proportional to scale (8-128 -> 0-255)
  MOV r22, r11
  LDI r23, 8
  SUB r22, r23       ; r22 = scale - 8
  ; Multiply by 2 to fill more of the bar
  LDI r23, 2
  MUL r22, r23
  LDI r20, 0
  LDI r21, 237
  LDI r23, 2
  RECTF r20, r21, r22, r23, r6

  RET
