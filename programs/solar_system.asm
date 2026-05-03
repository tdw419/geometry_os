; solar_system.asm -- Solar System Simulator for Geometry OS
;
; Interactive solar system with orbital mechanics, zoom, and pan.
;
; Controls:
;   W/S       -- Zoom in/out
;   A/D       -- Pan left/right
;   Q/E       -- Pan up/down
;   Space     -- Toggle orbit trails
;   R         -- Reset view
;
; Memory map:
;   0x3000-0x30FF  Sin table (256 entries, 0-127 range)
;   0x3200-0x321F  Star positions (16 stars x 2 words: x, y)
;   0x3400          Zoom (default 256)
;   0x3401          Center X offset
;   0x3402          Center Y offset
;   0x3403          Show orbits flag
;   0x3500-0x3535  Planet table (9 planets x 6 words)
;     Each planet: [distance, angle, speed, size, color, _pad]

; ── BOOT: Build sine table ─────────────────────────────────
boot:
  ; Build sine table at 0x3000 (256 entries, 0-127 range)
  LDI r20, 0x3000
  LDI r21, 0               ; i = 0
  LDI r22, 256             ; count
  LDI r23, 128             ; midpoint
  LDI r24, 16384           ; divisor

build_sin:
  CMP r21, r23
  BGE r0, sin_above
  MOV r25, r23
  SUB r25, r21
  JMP sin_sq
sin_above:
  MOV r25, r21
  SUB r25, r23
sin_sq:
  MUL r25, r25
  LDI r26, 127
  MUL r25, r26
  DIV r25, r24
  LDI r26, 127
  SUB r26, r25
  MOV r27, r20
  ADD r27, r21
  STORE r27, r26
  ADDI r21, 1
  CMP r21, r22
  BLT r0, build_sin

  ; Initialize star positions at 0x3200 (16 stars)
  ; Use simple spread positions
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

  ; Initialize planets at 0x3500
  LDI r20, 0x3500
  ; Sun: dist=0, angle=0, speed=0, size=5, color=yellow
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  STORE r20, r21
  ADDI r20, 1
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 5
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xFFFF00
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  ; Mercury: dist=30, angle=0, speed=5, size=2, color=gray
  LDI r21, 30
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 5
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 2
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xAAAAAA
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  ; Venus: dist=50, angle=80, speed=3, size=3, color=orange
  LDI r21, 50
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 80
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 3
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 3
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0xFFAA33
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  ; Earth: dist=70, angle=160, speed=2, size=3, color=blue
  LDI r21, 70
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 160
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 2
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 3
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0x3399FF
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  ; Mars: dist=95, angle=40, speed=2, size=2, color=red
  LDI r21, 95
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
  LDI r21, 0xFF4422
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  ; Jupiter: dist=130, angle=200, speed=1, size=5, color=tan
  LDI r21, 130
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
  LDI r21, 0xDDAA77
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  ; Saturn: dist=165, angle=120, speed=1, size=4, color=khaki
  LDI r21, 165
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
  LDI r21, 0xCCBB88
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  ; Uranus: dist=200, angle=240, speed=1, size=3, color=cyan
  LDI r21, 200
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
  LDI r21, 0x88CCDD
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  ; Neptune: dist=230, angle=60, speed=1, size=3, color=blue
  LDI r21, 230
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
  LDI r21, 0x4466FF
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1

  ; Init view state
  LDI r20, 0x3400
  LDI r21, 256
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 0
  STORE r20, r21
  ADDI r20, 1
  LDI r21, 1
  STORE r20, r21

  JMP main_loop

; ── MAIN LOOP ─────────────────────────────────────────────
main_loop:
  IKEY r9

  ; Clear screen to dark space
  LDI r9, 0x000510
  FILL r9

  ; Load view state
  LDI r22, 0x3400
  LOAD r22, r22
  LDI r23, 0x3401
  LOAD r23, r23
  LDI r24, 0x3402
  LOAD r24, r24
  LDI r25, 0x3403
  LOAD r25, r25

  ; Handle input
  IKEY r9
  JZ r9, no_input

  CMPI r9, 87
  JNZ r9, chk_s
  ADDI r22, 16
  JMP no_input
chk_s:
  CMPI r9, 83
  JNZ r9, chk_a
  SUBI r22, 16
  LDI r10, 32
  CMP r22, r10
  BGE r0, no_input
  MOV r22, r10
  JMP no_input
chk_a:
  CMPI r9, 65
  JNZ r9, chk_d
  SUBI r23, 4
  JMP no_input
chk_d:
  CMPI r9, 68
  JNZ r9, chk_q
  ADDI r23, 4
  JMP no_input
chk_q:
  CMPI r9, 81
  JNZ r9, chk_e
  SUBI r24, 4
  JMP no_input
chk_e:
  CMPI r9, 69
  JNZ r9, chk_sp
  ADDI r24, 4
  JMP no_input
chk_sp:
  CMPI r9, 32
  JNZ r9, chk_r
  LDI r10, 1
  XOR r25, r10
  JMP no_input
chk_r:
  CMPI r9, 82
  JNZ r9, no_input
  LDI r22, 256
  LDI r23, 0
  LDI r24, 0
no_input:

  ; Save view state
  LDI r20, 0x3400
  STORE r20, r22
  ADDI r20, 1
  STORE r20, r23
  ADDI r20, 1
  STORE r20, r24
  ADDI r20, 1
  STORE r20, r25

  ; Draw background stars
  LDI r20, 0x3200
  LDI r21, 0
stars_lp:
  LOAD r10, r20
  ADDI r20, 1
  LOAD r11, r20
  ADDI r20, 1
  LDI r12, 0x444455
  PSET r10, r11, r12
  ADDI r21, 1
  CMPI r21, 16
  BLT r0, stars_lp

  ; ── Draw planets ──
  LDI r20, 0x3500
  LDI r26, 9
  LDI r27, 0

planets_lp:
  MOV r21, r20
  LOAD r10, r21
  ADDI r21, 1
  LOAD r11, r21
  ADDI r21, 1
  LOAD r12, r21
  ADDI r21, 1
  LOAD r13, r21
  ADDI r21, 1
  LOAD r14, r21
  ADDI r21, 1

  ; Sun (index 0)
  CMPI r27, 0
  JNZ r27, not_sun

  ; Sun screen position
  LDI r15, 128
  ADD r15, r23
  LDI r16, 128
  ADD r16, r24

  ; Sun glow (8 points at radius 6)
  LDI r17, 6
  LDI r12, 0x332200
  MOV r18, r15
  MOV r19, r16
  SUB r19, r17
  PSET r18, r19, r12
  ADD r19, r17
  ADD r19, r17
  PSET r18, r19, r12
  SUB r18, r17
  MOV r19, r16
  PSET r18, r19, r12
  ADD r18, r17
  ADD r18, r17
  PSET r18, r19, r12
  ; Diagonals at radius 5
  LDI r17, 5
  MOV r18, r15
  SUB r18, r17
  MOV r19, r16
  SUB r19, r17
  PSET r18, r19, r12
  ADD r18, r17
  ADD r18, r17
  PSET r18, r19, r12
  SUB r18, r17
  SUB r18, r17
  ADD r19, r17
  ADD r19, r17
  PSET r18, r19, r12
  ADD r18, r17
  ADD r18, r17
  PSET r18, r19, r12
  ; Sun core (cross pattern)
  LDI r12, 0xFFFF00
  PSET r15, r16, r12
  MOV r18, r15
  ADDI r18, 1
  PSET r18, r16, r12
  MOV r18, r15
  SUBI r18, 1
  PSET r18, r16, r12
  MOV r19, r16
  ADDI r19, 1
  PSET r15, r19, r12
  MOV r19, r16
  SUBI r19, 1
  PSET r15, r19, r12

  JMP next_planet

not_sun:
  ; ── Draw orbit ring (32 dots) ──
  CMPI r25, 0
  JZ r0, skip_orbit

  ; Orbit radius = distance * zoom / 256
  MOV r15, r10
  MUL r15, r22
  SHRI r15, 8

  LDI r21, 0
orbit_lp:
  ; Lookup sin(angle)
  MOV r28, r21
  ANDI r28, 0xFF
  LDI r29, 0x3000
  ADD r29, r28
  LOAD r28, r29

  ; Lookup cos(angle) = sin((angle+64)&0xFF)
  ADD r29, r21
  ADDI r29, 64
  ANDI r29, 0xFF
  LDI r30, 0x3000
  ADD r30, r29
  LOAD r29, r30

  ; sx = 128 + center_x + sin * radius / 128
  MUL r28, r15
  SHRI r28, 7
  LDI r18, 128
  ADD r18, r23
  ADD r18, r28

  ; sy = 128 + center_y + cos * radius / 128
  MUL r29, r15
  SHRI r29, 7
  LDI r19, 128
  ADD r19, r24
  ADD r19, r29

  ; Bounds check (0..255) - skip if negative (bit 31 set)
  SAR r18, r31
  JNZ r18, orb_skip
  SAR r19, r31
  JNZ r19, orb_skip
  ; Skip if >= 256 (use unsigned check via shift)
  MOV r30, r18
  SHRI r30, 8
  JNZ r30, orb_skip
  MOV r30, r19
  SHRI r30, 8
  JNZ r30, orb_skip

  LDI r12, 0x111122
  PSET r18, r19, r12

orb_skip:
  ADDI r21, 16
  CMPI r21, 256
  BLT r0, orbit_lp

skip_orbit:
  ; ── Planet position via trig ──
  MOV r28, r11
  ANDI r28, 0xFF
  LDI r29, 0x3000
  ADD r29, r28
  LOAD r28, r29             ; sin(angle)
  ADD r29, r11
  ADDI r29, 64
  ANDI r29, 0xFF
  LDI r30, 0x3000
  ADD r30, r29
  LOAD r29, r30             ; cos(angle)

  ; world_x = sin * distance / 128
  MUL r28, r10
  SHRI r28, 7
  ; world_y = cos * distance / 128
  MUL r29, r10
  SHRI r29, 7

  ; screen_x = 128 + pan_x + world_x * zoom / 256
  MUL r28, r22
  SHRI r28, 8
  LDI r18, 128
  ADD r18, r23
  ADD r18, r28

  MUL r29, r22
  SHRI r29, 8
  LDI r19, 128
  ADD r19, r24
  ADD r19, r29

  ; Bounds check
  CMPI r18, 256
  BGE r0, upd_angle
  CMPI r19, 256
  BGE r0, upd_angle
  LDI r28, 31
  MOV r30, r18
  SAR r30, r28
  JNZ r30, upd_angle
  MOV r30, r19
  SAR r30, r28
  JNZ r30, upd_angle

  ; Draw planet
  PSET r18, r19, r14

  ; Larger planets get extra pixels
  CMPI r13, 3
  BLT r0, upd_angle
  MOV r28, r18
  ADDI r28, 1
  PSET r28, r19, r14
  MOV r28, r18
  SUBI r28, 1
  PSET r28, r19, r14
  CMPI r13, 5
  BLT r0, upd_angle
  MOV r28, r19
  ADDI r28, 1
  PSET r18, r28, r14
  MOV r28, r19
  SUBI r28, 1
  PSET r18, r28, r14

upd_angle:
  ADD r11, r12
  ANDI r11, 0xFF
  MOV r21, r20
  ADDI r21, 1
  STORE r21, r11

next_planet:
  ADDI r20, 6
  ADDI r27, 1
  CMP r27, r26
  BLT r0, planets_lp

  ; ── HUD: zoom bar ──
  LDI r20, 0x3400
  LOAD r20, r20
  SUBI r20, 32
  LDI r10, 480
  DIV r20, r10
  CMPI r20, 40
  BLT r0, hud_ok
  LDI r20, 40
hud_ok:
  LDI r21, 0
  LDI r22, 2
  LDI r12, 0x00FF88
hud_lp:
  CMP r21, r20
  BGE r0, hud_done
  PSET r21, r22, r12
  ADDI r21, 1
  JMP hud_lp
hud_done:

  FRAME
  JMP main_loop
