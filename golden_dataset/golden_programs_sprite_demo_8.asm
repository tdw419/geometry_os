; DESCRIPTION: This GeOS assembly code demonstrates animated sprites walking around the screen using the SPRBLT opcode with transparency and animation. It initializes four sprites with different shapes and colors, updates their positions based on velocity, and bounces them off the screen edges. The position of sprite 0 can be manually controlled using WASD keys, while the others move automatically in a bouncing pattern.

; sprite_demo.asm -- Animated sprites walking around the screen
; Demonstrates SPRBLT opcode (0x97) with transparency and animation
;
; Sprite sheet at RAM 0x3000:
;   Sprite 0: red square (16x16)
;   Sprite 1: green square (16x16)
;   Sprite 2: blue diamond (16x16, transparent corners)
;   Sprite 3: yellow cross (16x16, transparent background)
;
; Four sprites bounce around the screen. Uses signed velocity for bouncing.
; WASD moves sprite 0 manually. Others bounce automatically.

; -- Constants --
LDI r13, 1              ; increment
LDI r10, 16             ; sprite size
LDI r14, 240            ; screen limit (256 - 16)

; -- Build sprite sheet at 0x3000 --
CALL build_sprites

; -- Initialize sprite positions and velocities --
; Sprite 0 (red): position 20,20 velocity +1,+1
LDI r12, 0x5000        ; sprite data array base
LDI r9, 20
LDI r15, 20
LDI r7, 1
LDI r6, 1
CALL store_sprite_data

; Sprite 1 (green): position 200,50 velocity -1,+1
LDI r12, 0x5010
LDI r9, 200
LDI r15, 50
LDI r7, 0xFFFFFFFF    ; -1 as u32
LDI r6, 1
CALL store_sprite_data

; Sprite 2 (blue): position 100,150 velocity +1,-1
LDI r12, 0x5020
LDI r9, 100
LDI r15, 150
LDI r7, 1
LDI r6, 0xFFFFFFFF
CALL store_sprite_data

; Sprite 3 (yellow): position 50,200 velocity -1,-1
LDI r12, 0x5030
LDI r9, 50
LDI r15, 200
LDI r7, 0xFFFFFFFF
LDI r6, 0xFFFFFFFF
CALL store_sprite_data

; -- Animation loop --
game_loop:
  FILL r8              ; clear screen (black)

  ; Read keyboard for sprite 0 control
  IKEY r3
  ; Check WASD keys
  LDI r16, 87          ; W
  CMP r3, r16
  JZ r8, move_up
  LDI r16, 83          ; S
  CMP r3, r16
  JZ r8, move_down
  LDI r16, 65          ; A
  CMP r3, r16
  JZ r8, move_left
  LDI r16, 68          ; D
  CMP r3, r16
  JZ r8, move_right
  JMP update_sprites

move_up:
  LDI r12, 0x5014      ; sprite 0 vy
  LDI r9, 0xFFFFFFFF
  STORE r12, r9
  JMP update_sprites
move_down:
  LDI r12, 0x5014
  LDI r9, 1
  STORE r12, r9
  JMP update_sprites
move_left:
  LDI r12, 0x5013      ; sprite 0 vx
  LDI r9, 0xFFFFFFFF
  STORE r12, r9
  JMP update_sprites
move_right:
  LDI r12, 0x5013
  LDI r9, 1
  STORE r12, r9
  JMP update_sprites

update_sprites:
  ; Update and draw all 4 sprites
  LDI r12, 0x5000      ; sprite 0 base
  LDI r9, 0            ; sprite_id = 0
  CALL update_and_draw_sprite

  LDI r12, 0x5010
  LDI r9, 1
  CALL update_and_draw_sprite

  LDI r12, 0x5020
  LDI r9, 2
  CALL update_and_draw_sprite

  LDI r12, 0x5030
  LDI r9, 3
  CALL update_and_draw_sprite

  FRAME
  JMP game_loop

; -- Update sprite position and draw --
; r12 = sprite data base, r9 = sprite_id
; Data layout: [x, y, vx, vy] at r12+0..+3
update_and_draw_sprite:
  PUSH r31

  ; Load current position
  MOV r20, r12
  LOAD r21, r20         ; r21 = x
  MOV r20, r12
  ADD r20, r13
  LOAD r22, r20         ; r22 = y

  ; Load velocity
  MOV r20, r12
  LDI r23, 2
  ADD r20, r23
  LOAD r23, r20         ; r23 = vx
  MOV r20, r12
  LDI r24, 3
  ADD r20, r24
  LOAD r24, r20         ; r24 = vy

  ; Update position: x += vx, y += vy
  ADD r21, r23          ; x += vx
  ADD r22, r24          ; y += vy

  ; Bounce off walls (signed comparison)
  ; If x < 0: x = 0, negate vx
  LDI r25, 31
  MOV r26, r21
  SAR r26, r25          ; r26 = sign(x)
  JZ r26, check_x_max
  LDI r21, 0
  NEG r23
  JMP bounce_y

check_x_max:
  CMP r21, r14           ; x >= 240?
  BLT r8, bounce_y
  MOV r21, r14           ; x = 240
  NEG r23

bounce_y:
  ; If y < 0: y = 0, negate vy
  MOV r26, r22
  SAR r26, r25          ; r26 = sign(y)
  JZ r26, check_y_max
  LDI r22, 0
  NEG r24
  JMP store_back

check_y_max:
  CMP r22, r14           ; y >= 240?
  BLT r8, store_back
  MOV r22, r14
  NEG r24

store_back:
  ; Store updated position and velocity
  MOV r20, r12
  STORE r20, r21        ; x
  MOV r20, r12
  ADD r20, r13
  STORE r20, r22        ; y
  MOV r20, r12
  LDI r26, 2
  ADD r20, r26
  STORE r20, r23        ; vx
  MOV r20, r12
  LDI r26, 3
  ADD r20, r26
  STORE r20, r24        ; vy

  ; Draw sprite using SPRBLT
  LDI r2, 0x3000        ; sheet base address
  MOV r5, r9           ; sprite_id
  MOV r11, r21           ; x
  MOV r4, r22           ; y
  SPRBLT r2, r5, r11, r4

  POP r31
  RET

; -- Store sprite data helper --
; r12=base, r9=x, r15=y, r7=vx, r6=vy
store_sprite_data:
  STORE r12, r9
  MOV r3, r12
  ADD r3, r13
  STORE r3, r15
  MOV r3, r12
  LDI r16, 2
  ADD r3, r16
  STORE r3, r7
  MOV r3, r12
  LDI r16, 3
  ADD r3, r16
  STORE r3, r6
  RET

; -- Build 4 sprites in sprite sheet --
build_sprites:
  PUSH r31

  ; Sprite 0: solid red square (16x16)
  LDI r12, 0x3000
  LDI r9, 0xFF0000     ; red
  CALL fill_sprite

  ; Sprite 1: solid green square (16x16)
  LDI r12, 0x3100       ; 0x3000 + 256
  LDI r9, 0x00FF00     ; green
  CALL fill_sprite

  ; Sprite 2: blue diamond (transparent corners)
  LDI r12, 0x3200       ; 0x3000 + 512
  LDI r9, 0x0000FF     ; blue
  CALL fill_diamond

  ; Sprite 3: yellow cross (transparent background)
  LDI r12, 0x3300       ; 0x3000 + 768
  LDI r9, 0xFFFF00     ; yellow
  CALL fill_cross

  POP r31
  RET

; Fill a 16x16 sprite with solid color
; r12 = sprite start, r9 = color
fill_sprite:
  PUSH r31
  LDI r15, 256
  LDI r7, 0
fill_loop:
  STORE r12, r9
  ADD r12, r13
  ADD r7, r13
  CMP r7, r15
  BLT r8, fill_loop
  POP r31
  RET

; Fill a 16x16 sprite with a diamond pattern
; r12 = sprite start, r9 = color
fill_diamond:
  PUSH r31
  LDI r15, 0            ; row counter
diamond_row:
  CMP r15, r10            ; row < 16?
  BGE r8, diamond_done

  ; Diamond half-width at this row
  ; rows 0-7: width grows from 2 to 16
  ; rows 8-15: width shrinks from 14 to 2
  LDI r7, 8
  CMP r15, r7
  BGE r8, diamond_lower

  ; Upper half: width = (row+1) * 2
  MOV r6, r15
  ADD r6, r13
  LDI r3, 2
  MUL r6, r3           ; width
  LDI r3, 16
  SUB r3, r6
  SHR r3, r13            ; start_x = (16 - width) / 2
  JMP diamond_fill_row

diamond_lower:
  ; Lower half: width = (16 - row) * 2
  LDI r6, 16
  SUB r6, r15
  LDI r3, 2
  MUL r6, r3           ; width
  LDI r3, 16
  SUB r3, r6
  SHR r3, r13            ; start_x

diamond_fill_row:
  ; Fill from start_x to start_x + width
  MOV r16, r3           ; x = start_x
  ADD r6, r3           ; end_x = start_x + width
diamond_col:
  CMP r16, r6
  BGE r8, diamond_next_row

  ; Compute RAM address: sprite_base + row * 16 + x
  MOV r17, r15
  LDI r18, 16
  MUL r17, r18
  ADD r17, r16
  LDI r18, 0x3200
  ADD r17, r18
  STORE r17, r9

  ADD r16, r13
  JMP diamond_col

diamond_next_row:
  ADD r15, r13
  JMP diamond_row

diamond_done:
  POP r31
  RET

; Fill a 16x16 sprite with a cross pattern
; r12 = sprite start, r9 = color
fill_cross:
  PUSH r31
  LDI r15, 0            ; row counter
cross_row:
  CMP r15, r10
  BGE r8, cross_done

  LDI r7, 0            ; col counter
cross_col:
  CMP r7, r10
  BGE r8, cross_next_row

  ; Draw if in center rows (6-9) or center cols (6-9)
  LDI r6, 6
  CMP r15, r6
  BGE r8, cross_center_rows
  JMP cross_check_col
cross_center_rows:
  LDI r6, 10
  CMP r15, r6
  BLT r8, cross_draw_pixel
cross_check_col:
  LDI r6, 6
  CMP r7, r6
  BGE r8, cross_center_cols
  JMP cross_skip_pixel
cross_center_cols:
  LDI r6, 10
  CMP r7, r6
  BGE r8, cross_skip_pixel

cross_draw_pixel:
  MOV r3, r15
  LDI r16, 16
  MUL r3, r16
  ADD r3, r7
  LDI r16, 0x3300
  ADD r3, r16
  STORE r3, r9

cross_skip_pixel:
  ADD r7, r13
  JMP cross_col

cross_next_row:
  ADD r15, r13
  JMP cross_row

cross_done:
  POP r31
  RET
