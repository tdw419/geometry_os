; solar_system.asm -- Solar System Simulator for Geometry OS
;
; Interactive solar system with orbital mechanics, CIRCLE rendering,
; depth-sorted planets, and time controls.
;
; Controls (key bitmask at 0xFFB):
;   Up/Down arrows  -- Speed up / slow down time
;   Left/Right      -- Pan left / right
;   Space           -- Toggle orbit trails
;   R               -- Reset view and speed
;
; Memory map:
;   0x3000-0x30FF  Sin table (256 entries, signed: -127..+127 in 0..254 range)
;   0x3100-0x3109  Planet sort buffer (indices, 9 entries)
;   0x3200-0x321F  Star field (16 stars x 2 words: x, y)
;   0x3400          Zoom (default 256 = 1.0x)
;   0x3401          Pan X offset
;   0x3402          Pan Y offset
;   0x3403          Show orbits flag
;   0x3404          Time speed (1..8, default 2)
;   0x3405          Frame counter (TICKS mirror)
;   0x3500-0x3535  Planet table (9 bodies x 6 words)
;     Each: [distance, angle, speed, radius, color_hi, color_lo]
;
; Register conventions:
;   r0  = CMP result (reserved)
;   r1-r9  = temporaries
;   r10-r15 = planet parameters during render
;   r20-r29 = persistent across main loop
;   r30 = SP (0x8000)
;   r31 = LR (CALL/RET)

; ── BOOT: Build sine table ─────────────────────────────────
boot:
  LDI r30, 0x8000           ; stack pointer

  ; Build sine table at 0x3000 (256 entries)
  ; sin(i) for i=0..255, scaled to -127..+127, stored as (val+127)
  ; Using parabolic approximation: sin(x) ~ (4/pi)*x - (4/pi^2)*x*|x|
  ; For integer: sin6(i) = (127*4*(i/64) - 127*4*(i/64)*(i/64)/64) 
  ; Simplified: table[i] = (i < 128) ? 127*i/64 - 2*i*i/64 : 127*(256-i)/64 - 2*(256-i)^2/64
  LDI r20, 0x3000           ; table base
  LDI r21, 0                ; i = 0

build_sin:
  ; Phase 0-63: rising from 0 to 127
  ; Phase 64-127: falling from 127 to 0
  ; Phase 128-191: falling from 0 to -127
  ; Phase 192-255: rising from -127 to 0
  ; Use parabolic: if i < 128, t = i; else t = 256 - i
  ; sin_val = 127 - (t - 64)^2 * 127 / 64^2
  ;         = 127 - (t-64)*(t-64) * 127 / 4096
  LDI r22, 128
  CMP r21, r22
  BGE r0, sin_second
  MOV r22, r21
  JMP sin_t
sin_second:
  LDI r23, 256
  MOV r22, r23
  SUB r22, r21
sin_t:
  ; r22 = t (0..127)
  ; offset = t - 64
  LDI r23, 64
  MOV r24, r22
  SUB r24, r23             ; r24 = t - 64

  ; (t-64)^2
  PUSH r24
  MUL r24, r24
  ; Multiply by 127
  LDI r25, 127
  MUL r24, r25
  ; Divide by 4096 (64*64)
  LDI r25, 4096
  DIV r24, r25
  ; sin_val = 127 - result
  LDI r25, 127
  SUB r25, r24
  ; If i >= 128, negate
  POP r24
  LDI r26, 128
  CMP r21, r26
  BLT r0, sin_store
  LDI r26, 0
  SUB r26, r25
  MOV r25, r26
sin_store:
  ; Store as unsigned: sin_val + 127 (range 0..254)
  LDI r26, 127
  ADD r25, r26
  MOV r27, r20
  ADD r27, r21
  STORE r27, r25

  ADDI r21, 1
  LDI r22, 256
  CMP r21, r22
  BLT r0, build_sin

  ; ── Init star field at 0x3200 (16 stars) ──
  LDI r20, 0x3200
  LDI r21, 20
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 15
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 180
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 40
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 50
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 200
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 240
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 10
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 100
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 250
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 90
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 220
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 60
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 30
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 170
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 80
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 210
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 130
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 45
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 190
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 70
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 150
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 35
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 235
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 55
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 160
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 25
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 110
  STORE r20, r21
  ADDI r20, 1

  ; ── Init planets at 0x3500 (9 bodies x 6 words) ──
  ; [distance, angle, speed, radius, color_hi, color_lo]
  LDI r20, 0x3500

  ; Sun: dist=0, angle=0, speed=0, radius=6, 0xFFFF00
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  STORE r20, r21
  ADDI r20, 1
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 6
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xFFFF
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0x00
  STORE r20, r21
  ADDI r20, 1

  ; Mercury: dist=25, angle=0, speed=8, radius=2, 0xAAAAAA
  LDI r21, 25
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 8
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 2
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xAAAA
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xAA
  STORE r20, r21
  ADDI r20, 1

  ; Venus: dist=45, angle=80, speed=5, radius=3, 0xFFAA33
  LDI r21, 45
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 80
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 5
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 3
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xFFAA
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0x33
  STORE r20, r21
  ADDI r20, 1

  ; Earth: dist=65, angle=160, speed=3, radius=3, 0x3399FF
  LDI r21, 65
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 160
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 3
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 3
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0x3399
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xFF
  STORE r20, r21
  ADDI r20, 1

  ; Mars: dist=85, angle=40, speed=2, radius=2, 0xFF4422
  LDI r21, 85
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 40
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 2
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 2
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xFF44
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0x22
  STORE r20, r21
  ADDI r20, 1

  ; Jupiter: dist=120, angle=200, speed=1, radius=5, 0xDDAA77
  LDI r21, 120
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 200
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 1
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 5
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xDDAA
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0x77
  STORE r20, r21
  ADDI r20, 1

  ; Saturn: dist=155, angle=120, speed=1, radius=4, 0xCCBB88
  LDI r21, 155
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 120
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 1
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 4
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xCCBB
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0x88
  STORE r20, r21
  ADDI r20, 1

  ; Uranus: dist=190, angle=240, speed=1, radius=3, 0x88CCDD
  LDI r21, 190
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 240
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 1
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 3
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0x88CC
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xDD
  STORE r20, r21
  ADDI r20, 1

  ; Neptune: dist=220, angle=60, speed=1, radius=3, 0x4466FF
  LDI r21, 220
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 60
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 1
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 3
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0x4466
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xFF
  STORE r20, r21
  ADDI r20, 1

  ; ── Init view state ──
  LDI r20, 0x3400
  LDI r21, 256              ; zoom = 256 (1.0x)
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0                ; pan_x = 0
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0                ; pan_y = 0
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 1                ; show_orbits = 1
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 2                ; time_speed = 2
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0                ; frame counter = 0
  STORE r20, r21

  JMP main_loop

; ── MAIN LOOP ─────────────────────────────────────────────
main_loop:
  ; Read key bitmask (0xFFB): bit0=up, bit1=down, bit2=left, bit3=right,
  ;                            bit4=space, bit5=enter
  LDI r4, 0xFFB
  LOAD r5, r4

  ; Load view state
  LDI r1, 0x3400
  LOAD r1, r1               ; zoom
  LDI r2, 0x3401
  LOAD r2, r2               ; pan_x
  LDI r3, 0x3402
  LOAD r3, r3               ; pan_y
  LDI r6, 0x3403
  LOAD r6, r6               ; show_orbits
  LDI r7, 0x3404
  LOAD r7, r7               ; time_speed

  ; ── Process input (bitmask) ──
  ; bit0 = up -> speed up
  LDI r8, 1
  MOV r9, r5
  AND r9, r8
  JZ r9, chk_dn
  ADDI r7, 1
  LDI r8, 8
  CMP r7, r8
  BLT r0, chk_dn
  LDI r7, 8

chk_dn:
  ; bit1 = down -> slow down
  LDI r8, 2
  MOV r9, r5
  AND r9, r8
  JZ r9, chk_lt
  SUBI r7, 1
  LDI r8, 0
  CMP r7, r8
  BGE r0, chk_lt
  LDI r7, 0

  ; Time speed 0 = paused (no movement)
  ; We still allow zoom/pan when paused

chk_lt:
  ; bit2 = left -> pan left
  LDI r8, 4
  MOV r9, r5
  AND r9, r8
  JZ r9, chk_rt
  SUBI r2, 3
  JMP chk_done

chk_rt:
  ; bit3 = right -> pan right
  LDI r8, 8
  MOV r9, r5
  AND r9, r8
  JZ r9, chk_sp
  ADDI r2, 3
  JMP chk_done

chk_sp:
  ; bit4 = space -> toggle orbits (only on press, not hold)
  LDI r8, 16
  MOV r9, r5
  AND r9, r8
  JZ r9, chk_rst
  LDI r8, 1
  XOR r6, r8
  ; Debounce: wait for release (approx -- just toggle each frame is fine)
  JMP chk_done

chk_rst:
  ; IKEY for single-press keys (R = reset)
  IKEY r9
  JZ r9, chk_done
  ; R key = 114
  CMPI r9, 114
  JNZ r9, chk_done
  LDI r1, 256               ; zoom = default
  LDI r2, 0                 ; pan_x = 0
  LDI r3, 0                 ; pan_y = 0
  LDI r6, 1                 ; show_orbits = on
  LDI r7, 2                 ; time_speed = 2

chk_done:
  ; Save view state back
  LDI r20, 0x3400
  STORE r20, r1             ; zoom
  ADDI r20, 1
  STORE r20, r2             ; pan_x
  ADDI r20, 1
  STORE r20, r3             ; pan_y
  ADDI r20, 1
  STORE r20, r6             ; show_orbits
  ADDI r20, 1
  STORE r20, r7             ; time_speed

  ; Increment frame counter
  LDI r20, 0x3405
  LOAD r21, r20
  ADDI r21, 1
  STORE r20, r21

  ; ── CLEAR SCREEN ──
  LDI r9, 0x000810
  FILL r9

  ; ── Draw background stars ──
  LDI r20, 0x3200
  LDI r21, 0
stars_lp:
  LOAD r10, r20
  ADDI r20, 1
  LOAD r11, r20
  ADDI r20, 1
  LDI r12, 0x444466
  PSET r10, r11, r12
  ADDI r21, 1
  CMPI r21, 16
  BLT r0, stars_lp

  ; ── DEPTH SORT: build sort index by distance ──
  ; Planets further from center drawn first (painter's algorithm)
  ; Simple: Sun always first, then planets in distance order
  ; Since orbits don't cross, we just draw in order (far to near)
  ; But with varying distances per planet, sort by current Y position
  ; For simplicity: draw outer planets first (they're in the back)

  ; ── Update angles and compute positions ──
  ; Store screen Y at 0x3600+ for sorting
  LDI r20, 0x3500           ; planet base
  LDI r26, 9                ; planet count
  LDI r27, 0                ; index

update_lp:
  ; Skip angle update for Sun (index 0)
  CMPI r27, 0
  JNZ r27, upd_not_sun
  ADDI r20, 6
  ADDI r27, 1
  JMP upd_next

upd_not_sun:
  ; Load planet data
  MOV r21, r20
  LOAD r10, r21             ; distance
  ADDI r21, 1
  LOAD r11, r21             ; angle
  ADDI r21, 1
  LOAD r12, r21             ; speed
  ADDI r21, 1

  ; Update angle: angle += speed * time_speed
  MOV r13, r12
  MUL r13, r7               ; speed * time_speed
  ADD r11, r13
  ANDI r11, 0xFF            ; wrap 0-255
  MOV r21, r20
  ADDI r21, 1
  STORE r21, r11            ; save updated angle

  ; Compute screen Y for depth sorting
  ; cos(angle) = sin((angle+64) & 0xFF)
  MOV r14, r11
  ADDI r14, 64
  ANDI r14, 0xFF
  LDI r15, 0x3000
  ADD r15, r14
  LOAD r14, r15             ; cos(angle) as 0..254
  SUBI r14, 127             ; signed: -127..+127

  ; world_y = cos * distance / 128
  MUL r14, r10
  LDI r15, 128
  DIV r14, r15

  ; screen_y = 128 + pan_y + world_y * zoom / 256
  ; Store at 0x3600 + index*2 for sorting
  LDI r15, 0x3600
  ADD r15, r27
  ADD r15, r27              ; index * 2
  STORE r15, r14            ; store Y for sort

  ADDI r20, 6
  ADDI r27, 1
upd_next:
  CMP r27, r26
  BLT r0, update_lp

  ; ── Draw orbit trails (if enabled) ──
  CMPI r6, 0
  JZ r6, skip_orbits

  LDI r20, 0x3500           ; planet base
  LDI r27, 0                ; index

orbit_draw_lp:
  CMPI r27, 0
  JNZ r27, orb_not_sun
  ADDI r20, 6
  ADDI r27, 1
  JMP orb_draw_next

orb_not_sun:
  MOV r21, r20
  LOAD r10, r21             ; distance
  ADDI r21, 1

  ; Orbit radius on screen = distance * zoom / 256
  MOV r14, r10
  MUL r14, r1               ; distance * zoom
  LDI r15, 256
  DIV r14, r15              ; orbit_radius = dist * zoom / 256

  ; Center = (128 + pan_x, 128 + pan_y)
  LDI r15, 128
  ADD r15, r2               ; cx = 128 + pan_x
  LDI r16, 128
  ADD r16, r3               ; cy = 128 + pan_y

  ; Draw orbit as dotted circle using CIRCLE opcode
  ; Use dim color for orbits
  LDI r17, 0x111133
  CIRCLE r15, r16, r14, r17

  ADDI r20, 6
  ADDI r27, 1
orb_draw_next:
  CMP r27, r26
  BLT r0, orbit_draw_lp

skip_orbits:

  ; ── RENDER PLANETS (depth-sorted: far to near) ──
  ; Draw in reverse order: Neptune first (far), Sun last (near)
  ; This means outer planets render behind inner ones
  LDI r20, 0x3500           ; start at Sun (index 0)
  ; Actually draw outer to inner for depth: index 8..0
  ; But the simpler approach: draw farthest first.
  ; Neptune(8) -> Uranus(7) -> ... -> Sun(0)
  LDI r27, 8                ; start at Neptune

render_lp:
  ; Compute planet table address: 0x3500 + index * 6
  LDI r20, 6
  MUL r20, r27
  LDI r21, 0x3500
  ADD r20, r21              ; r20 = planet base addr

  ; Load planet data
  MOV r21, r20
  LOAD r10, r21             ; distance
  ADDI r21, 1
  LOAD r11, r21             ; angle
  ADDI r21, 1
  LOAD r12, r21             ; speed (not used for render)
  ADDI r21, 1
  LOAD r13, r21             ; radius (visual size)
  ADDI r21, 1
  LOAD r14, r21             ; color_hi
  ADDI r21, 1
  LOAD r15, r21             ; color_lo

  ; Reconstruct 24-bit color from hi/lo
  ; color = (color_hi << 8) | color_lo -- but GeOS uses u32 colors directly
  ; Actually we stored them split. Reconstruct:
  SHLI r14, 8
  OR r14, r15               ; r14 = full color

  CMPI r27, 0
  JNZ r27, not_sun2

  ; ── SUN: draw as glowing circle ──
  LDI r18, 128
  ADD r18, r2               ; sun_x = 128 + pan_x
  LDI r19, 128
  ADD r19, r3               ; sun_y = 128 + pan_y

  ; Outer glow (larger, dimmer)
  LDI r10, 10
  LDI r12, 0x332200
  CIRCLE r18, r19, r10, r12

  ; Sun body
  LDI r10, 6
  CIRCLE r18, r19, r10, r14

  JMP render_next

not_sun2:
  ; ── PLANET: compute screen position via sine lookup ──
  ; sin(angle) from table
  MOV r28, r11
  ANDI r28, 0xFF
  LDI r29, 0x3000
  ADD r29, r28
  LOAD r28, r29             ; sin(angle) as 0..254
  SUBI r28, 127             ; signed: -127..+127

  ; cos(angle) = sin((angle+64)&0xFF)
  MOV r29, r11
  ADDI r29, 64
  ANDI r29, 0xFF
  LDI r30, 0x3000
  ADD r30, r29
  LOAD r29, r30             ; cos(angle) as 0..254
  SUBI r29, 127             ; signed: -127..+127

  ; world_x = sin * distance / 128
  MOV r18, r28
  MUL r18, r10
  LDI r30, 128
  DIV r18, r30

  ; world_y = cos * distance / 128
  MOV r19, r29
  MUL r19, r10
  LDI r30, 128
  DIV r19, r30

  ; screen_x = 128 + pan_x + world_x * zoom / 256
  MUL r18, r1               ; world_x * zoom
  LDI r30, 256
  DIV r18, r30
  LDI r30, 128
  ADD r30, r2               ; 128 + pan_x
  ADD r18, r30              ; screen_x

  ; screen_y = 128 + pan_y + world_y * zoom / 256
  MUL r19, r1               ; world_y * zoom
  LDI r30, 256
  DIV r19, r30
  LDI r30, 128
  ADD r30, r3               ; 128 + pan_y
  ADD r19, r30              ; screen_y

  ; Bounds check: skip if off-screen
  ; Check negative (bit 31)
  LDI r30, 31
  MOV r28, r18
  SAR r28, r30
  JNZ r28, render_next
  MOV r28, r19
  SAR r28, r30
  JNZ r28, render_next
  ; Check >= 256
  CMPI r18, 256
  BGE r0, render_next
  CMPI r19, 256
  BGE r0, render_next

  ; Scale planet radius by zoom
  MOV r28, r13
  MUL r28, r1
  LDI r30, 256
  DIV r28, r30              ; scaled_radius = radius * zoom / 256
  ; Minimum radius 1
  CMPI r28, 1
  BGE r0, draw_planet
  LDI r28, 1

draw_planet:
  ; Draw planet circle
  CIRCLE r18, r19, r28, r14

  ; Saturn gets a ring (ellipse via LINE)
  CMPI r27, 6
  JNZ r27, render_next
  ; Saturn ring: 2 diagonal lines
  LDI r30, 2
  ADD r30, r28              ; ring extends 2 pixels beyond radius
  MOV r10, r18
  SUB r10, r30              ; ring_left_x
  MOV r11, r19
  ADDI r11, 1               ; ring_y = planet_y + 1
  MOV r12, r18
  ADD r12, r30              ; ring_right_x
  MOV r13, r19
  ADDI r13, 1
  LDI r15, 0xCCBB88        ; ring color (same as Saturn)
  LINE r10, r11, r12, r13, r15

render_next:
  ; Move to next planet (going from 8 down to 0)
  SUBI r27, 1
  LDI r30, 0
  CMP r27, r30              ; check if done (wraps to -1 = 0xFFFFFFFF)
  ; When r27 goes below 0, it becomes a huge number
  LDI r30, 31
  MOV r28, r27
  SAR r28, r30              ; if negative (bit 31 set), done
  JNZ r28, render_done
  JMP render_lp

render_done:

  ; ── HUD: Speed indicator ──
  ; Draw speed bar at bottom-left
  LDI r20, 0x3404
  LOAD r20, r20             ; time_speed (0-8)
  LDI r21, 0
  LDI r22, 248              ; y position
  LDI r12, 0x00FF88
hud_lp:
  CMP r21, r20
  BGE r0, hud_done
  PSET r21, r22, r12
  ADDI r21, 1
  JMP hud_lp
hud_done:

  ; ── HUD: zoom indicator ──
  LDI r20, 0x3400
  LOAD r20, r20             ; zoom
  SUBI r20, 32
  LDI r30, 480
  DIV r20, r30
  CMPI r20, 30
  BLT r0, zoom_ok
  LDI r20, 30
zoom_ok:
  LDI r21, 0
  LDI r22, 252              ; y position
  LDI r12, 0xFFAA00
zoom_lp:
  CMP r21, r20
  BGE r0, zoom_done
  PSET r21, r22, r12
  ADDI r21, 1
  JMP zoom_lp
zoom_done:

  FRAME
  JMP main_loop
