; terrain_flyover.asm -- 3D terrain flyover demo
;
; Fly over procedural heightmap terrain with perspective projection.
; Per-column raymarch, painter's algorithm (far to near).
; Height-based coloring (water/grass/mountain) with distance fog bands.
;
; Controls: W=altitude up, S=altitude down, D=speed up, A=speed down
;
; Memory:
;   0x4000-0x4FFF  heightmap (64x64 = 4096 u32 words)
;   0x6000         camera_z
;   0x6001         camera_alt
;   0x6002         camera_speed
;
; Register convention:
;   r7  = 1 (constant)
;   r8  = 128 (screen center)
;   r9  = 0x4000 (heightmap base)
;   r10 = column index (0-255)
;   r11 = world_x_offset
;   r12 = z distance
;   r13 = heightmap value
;   r14 = screen_y
;   r15 = draw height
;   r16 = color
;   r17-r29 = temps

; ========================================
; Build heightmap (64x64 at 0x4000)
; ========================================
LDI r7, 1
LDI r8, 128
LDI r9, 0x4000
LDI r17, 64             ; 64x64 grid

LDI r18, 0              ; z row

hm_z_loop:
  LDI r19, 0            ; x col

hm_x_loop:
  ; height = ((x*37 + z*53 + x*z*7) & 63) + 12  (range 12-75)
  MOV r20, r19
  LDI r21, 37
  MUL r20, r21           ; x*37
  MOV r21, r18
  LDI r22, 53
  MUL r21, r22           ; z*53
  ADD r20, r21
  MOV r21, r19
  MUL r21, r18           ; x*z
  LDI r22, 7
  MUL r21, r22           ; x*z*7
  ADD r20, r21
  LDI r21, 0x3F
  AND r20, r21           ; & 63
  LDI r21, 12
  ADD r20, r21           ; +12

  ; store at 0x4000 + z*64 + x
  MOV r21, r18
  LDI r22, 64
  MUL r21, r22
  ADD r21, r19
  ADD r21, r9
  STORE r21, r20

  ADD r19, r7
  CMP r19, r17
  BLT r0, hm_x_loop

  ADD r18, r7
  CMP r18, r17
  BLT r0, hm_z_loop

; ========================================
; Init camera
; ========================================
LDI r23, 0x6000
LDI r20, 0
STORE r23, r20           ; camera_z = 0
LDI r23, 0x6001
LDI r20, 80
STORE r23, r20           ; camera_alt = 80
LDI r23, 0x6002
LDI r20, 3
STORE r23, r20           ; speed = 3

; ========================================
; Main loop
; ========================================
main:
  LDI r20, 0
  FILL r20               ; clear to black

  ; --- Input handling ---
  IKEY r20
  CMP r20, r7
  JZ r0, input_done

  ; W (87) = altitude up
  LDI r21, 87
  CMP r20, r21
  JNZ r0, chk_s
  LDI r23, 0x6001
  LOAD r20, r23
  ADD r20, r7
  ADD r20, r7             ; alt += 2
  STORE r23, r20
  JMP input_done

chk_s:
  ; S (83) = altitude down
  LDI r21, 83
  CMP r20, r21
  JNZ r0, chk_d
  LDI r23, 0x6001
  LOAD r20, r23
  SUB r20, r7
  SUB r20, r7             ; alt -= 2
  STORE r23, r20
  JMP input_done

chk_d:
  ; D (68) = speed up
  LDI r21, 68
  CMP r20, r21
  JNZ r0, chk_a
  LDI r23, 0x6002
  LOAD r20, r23
  ADD r20, r7             ; speed += 1
  STORE r23, r20
  JMP input_done

chk_a:
  ; A (65) = speed down
  LDI r21, 65
  CMP r20, r21
  JNZ r0, input_done
  LDI r23, 0x6002
  LOAD r20, r23
  CMP r20, r7             ; min speed 1
  BLT r0, input_done
  SUB r20, r7             ; speed -= 1
  STORE r23, r20

input_done:

  ; --- Advance camera ---
  LDI r23, 0x6000
  LOAD r20, r23           ; camera_z
  LDI r24, 0x6002
  LOAD r21, r24           ; speed
  ADD r20, r21
  STORE r23, r20

  ; ========================================
  ; Render: per-column raymarch (far to near)
  ; ========================================
  LDI r10, 0             ; column x = 0

col_loop:
  ; world_x_offset = (cx - 128) * 8
  MOV r11, r10
  LDI r20, 128
  SUB r11, r20
  LDI r20, 8
  MUL r11, r20           ; r11 = world_x_offset

  ; Raymarch from z=190 (far) down to z=4 (near), step -3
  LDI r12, 190           ; z distance

ray_loop:
  ; --- Heightmap lookup ---
  ; hmap_x = ((world_x_offset + z*2) >> 2) & 63
  MOV r24, r11
  MOV r25, r12
  SHL r25, r7            ; z*2
  ADD r24, r25
  SAR r24, r7
  SAR r24, r7            ; >> 2
  LDI r25, 0x3F
  AND r24, r25           ; hmap_x

  ; hmap_z = ((camera_z + z) >> 2) & 63
  LDI r25, 0x6000
  LOAD r26, r25           ; camera_z
  ADD r26, r12
  SAR r26, r7
  SAR r26, r7            ; >> 2
  LDI r25, 0x3F
  AND r26, r25           ; hmap_z

  ; addr = base + hmap_z*64 + hmap_x
  MOV r25, r26
  LDI r26, 64
  MUL r25, r26
  ADD r25, r24
  ADD r25, r9            ; + 0x4000
  LOAD r13, r25          ; r13 = terrain height

  ; --- Project to screen Y ---
  ; screen_y = 128 + (alt - height) * 100 / z
  LDI r25, 0x6001
  LOAD r26, r25           ; camera_alt
  SUB r26, r13           ; alt - height
  LDI r25, 100
  MUL r26, r25           ; * 100
  DIV r26, r12           ; / z
  ADD r26, r8            ; + 128
  MOV r14, r26           ; r14 = screen_y

  ; --- Color: height-based with 3-band distance fog ---
  ; Water: h < 28, Grass: 28-49, Mountain: 50+
  ; Near (z<64): bright, Mid (64-127): medium, Far (128+): dark

  LDI r16, 0             ; default black (will be overwritten)

  ; --- Water ---
  LDI r20, 28
  CMP r13, r20
  BGE r0, chk_grass

  ; Water colors
  LDI r20, 64
  CMP r12, r20
  BGE r0, water_mid
  LDI r16, 0x2266DD      ; near water
  JMP got_color

water_mid:
  LDI r20, 128
  CMP r12, r20
  BGE r0, water_far
  LDI r16, 0x113366      ; mid water
  JMP got_color

water_far:
  LDI r16, 0x0A1A33      ; far water
  JMP got_color

  ; --- Grass ---
chk_grass:
  LDI r20, 50
  CMP r13, r20
  BGE r0, chk_mountain

  LDI r20, 64
  CMP r12, r20
  BGE r0, grass_mid
  LDI r16, 0x00CC44      ; near grass
  JMP got_color

grass_mid:
  LDI r20, 128
  CMP r12, r20
  BGE r0, grass_far
  LDI r16, 0x006622      ; mid grass
  JMP got_color

grass_far:
  LDI r16, 0x002211      ; far grass
  JMP got_color

  ; --- Mountain ---
chk_mountain:
  LDI r20, 64
  CMP r12, r20
  BGE r0, mt_mid
  LDI r16, 0xAA8855      ; near mountain
  JMP got_color

mt_mid:
  LDI r20, 128
  CMP r12, r20
  BGE r0, mt_far
  LDI r16, 0x554422      ; mid mountain
  JMP got_color

mt_far:
  LDI r16, 0x221100      ; far mountain

got_color:
  ; --- Draw terrain column ---
  ; height = 256 - screen_y (draw from screen_y to bottom)
  LDI r15, 256
  SUB r15, r14           ; r15 = draw height
  CMP r15, r7
  JZ r0, ray_next        ; skip if 0 or negative height

  ; Clamp: if screen_y > 256, nothing to draw
  LDI r20, 256
  CMP r14, r20
  BGE r0, ray_next

  ; Clamp height to max 256
  CMP r15, r20
  BLT r0, draw_ok
  MOV r15, r20

draw_ok:
  ; RECTF x, y, width, height, color
  RECTF r10, r14, r7, r15, r16

ray_next:
  ; z -= 3 (step toward camera)
  SUB r12, r7
  SUB r12, r7
  SUB r12, r7
  LDI r20, 4
  CMP r12, r20
  BGE r0, ray_loop

  ; Next column
  ADD r10, r7
  LDI r20, 256
  CMP r10, r20
  BLT r0, col_loop

  ; --- Draw sky (top half) ---
  LDI r20, 0             ; x = 0
  LDI r21, 0             ; y = 0
  LDI r22, 256           ; width = 256
  LDI r23, 0x0A0A2A      ; dark sky blue
  RECTF r20, r21, r22, r8, r23

  FRAME
  JMP main
