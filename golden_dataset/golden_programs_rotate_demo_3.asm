; DESCRIPTION: This GeOS assembly code demonstrates interactive rotation and scaling of an asymmetric sprite using keyboard controls. The sprite is drawn as a colored L-shape, which is then rotated and scaled based on user input from the keyboard. The angle and scale factor can be adjusted using specific keys, and the changes are visualized in real-time.

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
;   r7  = sprite x position (top-left of rendered area)
;   r9  = sprite y position (top-left of rendered area)
;   r13  = base sprite size (32x32)
;   r6  = current scale factor (32 = 1x, 64 = 2x, etc.)
;   r5  = angle (fixed-point radians, increments by 64 = ~14 degrees)
;   r15  = scratch
;   r4  = key code from IKEY
;   r0  = color (red)
;   r8  = 0 (black for clearing)
;   r1 = color (green)
;   r10 = color (blue)
;   r2 = color (yellow)
;   r12 = source x (sprite drawn at fixed position)
;   r14 = source y
;   r11 = dest x (scaled output position)
;   r16 = dest y

; ── init ──────────────────────────────────────────────────────
LDI r7, 0        ; sprite screen x (computed each frame)
LDI r9, 0        ; sprite screen y (computed each frame)
LDI r13, 32       ; base sprite size
LDI r6, 32       ; scale = 1x (32x32 output = 32x32 source)
LDI r5, 0        ; angle = 0
LDI r0, 0xFF0000 ; red
LDI r8, 0        ; black
LDI r1, 0x00FF00 ; green
LDI r10, 0x0000FF ; blue
LDI r2, 0xFFFF00 ; yellow
LDI r12, 0       ; source x (sprite drawn at top-left)
LDI r14, 0       ; source y

; ── main loop ──────────────────────────────────────────────────
main_loop:
  FILL r8           ; clear screen to black

  ; Draw the base sprite into the source area (0,0) to (31,31)
  ; Asymmetric L-shape so rotation is visible
  CALL draw_sprite

  ; Compute dest position: center the scaled sprite on screen
  ; dest_x = 128 - scale/2
  MOV r15, r6
  LDI r19, 2
  DIV r15, r19       ; r15 = scale / 2
  LDI r11, 128
  SUB r11, r15       ; dest_x = 128 - scale/2

  ; dest_y = 128 - scale/2
  LDI r16, 128
  SUB r16, r15       ; dest_y = 128 - scale/2

  ; Step 1: Scale the source sprite to dest area
  ; SCALE sx_reg, sy_reg, sw_reg, sh_reg, dx_reg, dy_reg, dw_reg, dh_reg
  SCALE r12, r14, r13, r13, r11, r16, r6, r6

  ; Step 2: Rotate the scaled sprite in-place
  ; ROTATE x_reg, y_reg, w_reg, h_reg, angle_reg
  ROTATE r11, r16, r6, r6, r5

  ; Draw HUD text showing angle and scale
  CALL draw_hud

  ; Read keyboard input
  IKEY r4

  ; Right arrow (or D) = increase angle
  LDI r15, 68
  CMP r4, r15
  JZ r3, angle_inc
  LDI r15, 100
  CMP r4, r15
  JZ r3, angle_inc

  ; Left arrow (or A) = decrease angle
  LDI r15, 65
  CMP r4, r15
  JZ r3, angle_dec
  LDI r15, 97
  CMP r4, r15
  JZ r3, angle_dec

  ; Up arrow = increase scale
  LDI r15, 87
  CMP r4, r15
  JZ r3, scale_up
  LDI r15, 119
  CMP r4, r15
  JZ r3, scale_up

  ; Down arrow = decrease scale
  LDI r15, 83
  CMP r4, r15
  JZ r3, scale_down
  LDI r15, 115
  CMP r4, r15
  JZ r3, scale_down

  ; R = reset
  LDI r15, 82
  CMP r4, r15
  JZ r3, do_reset
  LDI r15, 114
  CMP r4, r15
  JZ r3, do_reset

  ; Q = quit
  LDI r15, 81
  CMP r4, r15
  JZ r3, do_quit
  LDI r15, 113
  CMP r4, r15
  JZ r3, do_quit

  JMP frame_done

angle_inc:
  LDI r15, 64
  ADD r5, r15        ; +64 fixed-point (~14 degrees)
  JMP frame_done

angle_dec:
  LDI r15, 64
  SUB r5, r15        ; -64 fixed-point (~14 degrees)
  JMP frame_done

scale_up:
  LDI r15, 8
  ADD r6, r15        ; increase scale
  ; Clamp: max 128
  LDI r15, 128
  CMP r6, r15
  BLT r3, frame_done
  LDI r6, 128
  JMP frame_done

scale_down:
  LDI r15, 8
  SUB r6, r15        ; decrease scale
  ; Clamp: min 8
  LDI r15, 8
  CMP r6, r15
  BGE r3, frame_done
  LDI r6, 8
  JMP frame_done

do_reset:
  LDI r5, 0         ; angle = 0
  LDI r6, 32        ; scale = 1x
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
  RECTF r8, r8, r13, r13, r0
  ; Actually, let's draw an asymmetric pattern:
  ; Top-left 16x16 = red
  LDI r20, 0
  LDI r21, 0
  LDI r22, 16
  LDI r23, 16
  RECTF r20, r21, r22, r23, r0

  ; Top-right 16x16 = green
  LDI r20, 16
  LDI r21, 0
  LDI r22, 16
  LDI r23, 16
  RECTF r20, r21, r22, r23, r1

  ; Bottom-left 16x16 = blue
  LDI r20, 0
  LDI r21, 16
  LDI r22, 16
  LDI r23, 16
  RECTF r20, r21, r22, r23, r10

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
  ADD r20, r4
  STRO r20, ":"
  ADD r20, r4

  ; We can't easily convert angle to decimal in ASM,
  ; so just show a bar indicator instead.
  ; Draw angle bar at y=230 (bottom area)
  ; Bar width proportional to angle (mod 256)
  MOV r20, r5
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
  MOV r22, r5
  LDI r23, 255
  AND r22, r23
  LDI r23, 2
  RECTF r20, r21, r22, r23, r1

  ; Scale indicator bar at y=236
  LDI r20, 0
  LDI r21, 236
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r24

  ; Scale bar: width proportional to scale (8-128 -> 0-255)
  MOV r22, r6
  LDI r23, 8
  SUB r22, r23       ; r22 = scale - 8
  ; Multiply by 2 to fill more of the bar
  LDI r23, 2
  MUL r22, r23
  LDI r20, 0
  LDI r21, 237
  LDI r23, 2
  RECTF r20, r21, r22, r23, r10

  RET
