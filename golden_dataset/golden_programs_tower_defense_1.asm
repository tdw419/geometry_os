; DESCRIPTION: This GeOS assembly code implements a basic tower defense game. The game features a grid-based play area with enemies following a predefined path to the right through 10 waypoints. Players can place three types of towers (Arrow, Cannon, Ice) on the grid to defend against waves of increasing difficulty. Each tower has unique attributes such as cost, range, damage, and cooldown time. The game includes UI elements for gold, lives, wave progression, and tower selection indicators. The main loop handles input, enemy spawning, movement, tower updates, shooting logic, rendering, and UI drawing.

; tower_defense.asm -- Tower Defense Game for Geometry OS
;
; Grid: 16x14 cells (16px each), play area y=0..223, UI panel y=224..255
; Path: winding brown road from left to right through 10 waypoints
; Towers: 3 types placed by cursor
;   1=Arrow (green, 10g, fast, 1dmg, range 48px)
;   2=Cannon (red, 25g, slow, 3dmg, range 40px)
;   3=Ice (cyan, 15g, medium, 1dmg+slow, range 56px)
; Enemies: follow path, killed for gold, lose life if reach end
; Waves: increasing difficulty, press N to start next wave
;
; Controls:
;   WASD / arrows -- move cursor
;   1/2/3 -- select tower type
;   Space -- place tower at cursor
;   N -- start next wave
;   R -- restart
;
; Memory layout:
;   0x2000      waypoint_count (10)
;   0x2001..14  waypoints (10 x 2 words: pixel_x, pixel_y)
;   0x2100      enemy_count (active with hp>0)
;   0x2101+     enemies (16 x 4 words: px_x, px_y, hp, wp_idx)
;   0x2200      tower_count
;   0x2201+     towers (8 x 4 words: cell_x, cell_y, type, cd_timer)
;   0x2300      shot_count
;   0x2301+     shots (8 x 3 words: ex, ey, timer)
;   0x2400      gold (start 50)
;   0x2401      lives (start 20)
;   0x2402      wave (start 0)
;   0x2403      wave_active
;   0x2404      spawn_timer
;   0x2405      enemies_spawned
;   0x2406      enemies_per_wave
;   0x2407      game_over
;   0x2408      cursor_cx (0-15)
;   0x2409      cursor_cy (0-13)
;   0x240A      placing_type (0=none,1=arrow,2=cannon,3=ice)

; ═══════════════════════════════════════════════════════════════
; INITIALIZATION
; ═══════════════════════════════════════════════════════════════
restart:
  LDI r30, 0x9000

  LDI r3, 50
  LDI r8, 0x2400
  STORE r8, r3
  LDI r3, 20
  LDI r8, 0x2401
  STORE r8, r3
  LDI r3, 0
  LDI r8, 0x2402
  STORE r8, r3
  LDI r8, 0x2403
  STORE r8, r3
  LDI r8, 0x2405
  STORE r8, r3
  LDI r8, 0x2407
  STORE r8, r3
  LDI r8, 0x2408
  STORE r8, r3
  LDI r8, 0x2409
  STORE r8, r3
  LDI r8, 0x240A
  STORE r8, r3
  LDI r8, 0x2100
  STORE r8, r3
  LDI r8, 0x2200
  STORE r8, r3
  LDI r8, 0x2300
  STORE r8, r3

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r3, 10
  LDI r8, 0x2000
  STORE r8, r3

  ; wp0 (8, 40)
  LDI r3, 8
  LDI r8, 0x2001
  STORE r8, r3
  LDI r3, 40
  LDI r8, 0x2002
  STORE r8, r3
  ; wp1 (104, 40)
  LDI r3, 104
  LDI r8, 0x2003
  STORE r8, r3
  LDI r3, 40
  LDI r8, 0x2004
  STORE r8, r3
  ; wp2 (104, 104)
  LDI r3, 104
  LDI r8, 0x2005
  STORE r8, r3
  LDI r3, 104
  LDI r8, 0x2006
  STORE r8, r3
  ; wp3 (40, 104)
  LDI r3, 40
  LDI r8, 0x2007
  STORE r8, r3
  LDI r3, 104
  LDI r8, 0x2008
  STORE r8, r3
  ; wp4 (40, 168)
  LDI r3, 40
  LDI r8, 0x2009
  STORE r8, r3
  LDI r3, 168
  LDI r8, 0x200A
  STORE r8, r3
  ; wp5 (136, 168)
  LDI r3, 136
  LDI r8, 0x200B
  STORE r8, r3
  LDI r3, 168
  LDI r8, 0x200C
  STORE r8, r3
  ; wp6 (136, 72)
  LDI r3, 136
  LDI r8, 0x200D
  STORE r8, r3
  LDI r3, 72
  LDI r8, 0x200E
  STORE r8, r3
  ; wp7 (216, 72)
  LDI r3, 216
  LDI r8, 0x200F
  STORE r8, r3
  LDI r3, 72
  LDI r8, 0x2010
  STORE r8, r3
  ; wp8 (216, 168)
  LDI r3, 216
  LDI r8, 0x2011
  STORE r8, r3
  LDI r3, 168
  LDI r8, 0x2012
  STORE r8, r3
  ; wp9 (248, 168)
  LDI r3, 248
  LDI r8, 0x2013
  STORE r8, r3
  LDI r3, 168
  LDI r8, 0x2014
  STORE r8, r3

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r8, 0x2407
  LOAD r3, r8
  JNZ r3, game_over_screen

  ; clear screen dark green
  LDI r3, 0x1A3A1A
  FILL r3

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r3, 0x1A1A3A
  LDI r15, 0
  LDI r0, 224
  LDI r12, 256
  LDI r2, 32
  RECTF r15, r0, r12, r2, r3

  PUSH r31
  CALL handle_input
  POP r31

  PUSH r31
  CALL spawn_logic
  POP r31

  PUSH r31
  CALL move_all_enemies
  POP r31

  PUSH r31
  CALL update_all_towers
  POP r31

  PUSH r31
  CALL draw_shots
  POP r31

  PUSH r31
  CALL draw_enemies
  POP r31

  PUSH r31
  CALL draw_towers
  POP r31

  PUSH r31
  CALL draw_cursor
  POP r31

  PUSH r31
  CALL draw_ui
  POP r31

  FRAME
  JMP game_loop

; ═══════════════════════════════════════════════════════════════
; GAME OVER SCREEN
; ═══════════════════════════════════════════════════════════════
game_over_screen:
  LDI r3, 0x550000
  FILL r3
  FRAME
  IKEY r3
  JZ r3, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r15, 0
  LDI r0, 32
  LDI r12, 112
  LDI r2, 16
  RECTF r15, r0, r12, r2, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r15, 96
  LDI r0, 32
  LDI r12, 16
  LDI r2, 80
  RECTF r15, r0, r12, r2, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r15, 32
  LDI r0, 96
  LDI r12, 80
  LDI r2, 16
  RECTF r15, r0, r12, r2, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r15, 32
  LDI r0, 96
  LDI r12, 16
  LDI r2, 80
  RECTF r15, r0, r12, r2, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r15, 32
  LDI r0, 160
  LDI r12, 112
  LDI r2, 16
  RECTF r15, r0, r12, r2, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r15, 128
  LDI r0, 64
  LDI r12, 16
  LDI r2, 112
  RECTF r15, r0, r12, r2, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r15, 128
  LDI r0, 64
  LDI r12, 96
  LDI r2, 16
  RECTF r15, r0, r12, r2, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r15, 208
  LDI r0, 64
  LDI r12, 16
  LDI r2, 112
  RECTF r15, r0, r12, r2, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r15, 208
  LDI r0, 160
  LDI r12, 48
  LDI r2, 16
  RECTF r15, r0, r12, r2, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r15, 0
  LDI r0, 32
  LDI r12, 4
  LDI r2, 16
  RECTF r15, r0, r12, r2, r22
  LDI r22, 0xCC0000
  LDI r15, 252
  LDI r0, 160
  RECTF r15, r0, r12, r2, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r7
  JZ r7, input_done

  LDI r2, 87
  CMP r7, r2
  JZ r6, input_up
  LDI r2, 119
  CMP r7, r2
  JZ r6, input_up
  LDI r2, 83
  CMP r7, r2
  JZ r6, input_down
  LDI r2, 115
  CMP r7, r2
  JZ r6, input_down
  LDI r2, 65
  CMP r7, r2
  JZ r6, input_left
  LDI r2, 97
  CMP r7, r2
  JZ r6, input_left
  LDI r2, 68
  CMP r7, r2
  JZ r6, input_right
  LDI r2, 100
  CMP r7, r2
  JZ r6, input_right
  LDI r2, 49
  CMP r7, r2
  JZ r6, input_sel1
  LDI r2, 50
  CMP r7, r2
  JZ r6, input_sel2
  LDI r2, 51
  CMP r7, r2
  JZ r6, input_sel3
  LDI r2, 32
  CMP r7, r2
  JZ r6, input_place
  LDI r2, 78
  CMP r7, r2
  JZ r6, input_newwave
  LDI r2, 110
  CMP r7, r2
  JZ r6, input_newwave
  LDI r2, 82
  CMP r7, r2
  JZ r6, do_restart
  LDI r2, 114
  CMP r7, r2
  JZ r6, do_restart
  JMP input_done

input_up:
  LDI r8, 0x2409
  LOAD r3, r8
  JZ r3, input_done
  LDI r2, 1
  SUB r3, r2
  STORE r8, r3
  JMP input_done

input_down:
  LDI r8, 0x2409
  LOAD r3, r8
  LDI r2, 13
  CMP r3, r2
  BGE r6, input_done
  LDI r2, 1
  ADD r3, r2
  STORE r8, r3
  JMP input_done

input_left:
  LDI r8, 0x2408
  LOAD r3, r8
  JZ r3, input_done
  LDI r2, 1
  SUB r3, r2
  STORE r8, r3
  JMP input_done

input_right:
  LDI r8, 0x2408
  LOAD r3, r8
  LDI r2, 15
  CMP r3, r2
  BGE r6, input_done
  LDI r2, 1
  ADD r3, r2
  STORE r8, r3
  JMP input_done

input_sel1:
  LDI r3, 1
  LDI r8, 0x240A
  STORE r8, r3
  JMP input_done

input_sel2:
  LDI r3, 2
  LDI r8, 0x240A
  STORE r8, r3
  JMP input_done

input_sel3:
  LDI r3, 3
  LDI r8, 0x240A
  STORE r8, r3
  JMP input_done

input_newwave:
  LDI r8, 0x2403
  LOAD r3, r8
  JNZ r3, input_done
  PUSH r31
  CALL start_wave
  POP r31
  JMP input_done

do_restart:
  ; POP the value game_loop pushed, then restart
  POP r31
  JMP restart

input_place:
  LDI r8, 0x240A
  LOAD r3, r8
  JZ r3, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r2, 2
  CMP r3, r2
  BGE r6, place_type2or3
  LDI r2, 10
  JMP place_check_gold
place_type2or3:
  LDI r2, 3
  CMP r3, r2
  JZ r6, place_type3
  LDI r2, 25
  JMP place_check_gold
place_type3:
  LDI r2, 15

place_check_gold:
  ; r2=cost, r3=type
  LDI r8, 0x2400
  LOAD r15, r8
  CMP r15, r2
  BLT r6, input_done

  LDI r8, 0x2200
  LOAD r0, r8
  LDI r7, 8
  CMP r0, r7
  BGE r6, input_done

  LDI r8, 0x2409
  LOAD r7, r8
  LDI r12, 14
  CMP r7, r12
  BGE r6, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r3, input_done

  ; deduct gold
  SUB r15, r2
  LDI r8, 0x2400
  STORE r8, r15

  ; slot addr = 0x2201 + count * 4
  LDI r8, 0x2200
  LOAD r0, r8
  LDI r7, 4
  MUL r0, r7
  LDI r12, 0x2201
  ADD r12, r0

  ; cell_x
  LDI r8, 0x2408
  LOAD r0, r8
  STORE r12, r0
  LDI r7, 1
  ADD r12, r7
  ; cell_y
  LDI r8, 0x2409
  LOAD r0, r8
  STORE r12, r0
  LDI r7, 1
  ADD r12, r7
  ; type
  STORE r12, r3
  LDI r7, 1
  ADD r12, r7
  ; cd_timer = 0
  LDI r0, 0
  STORE r12, r0

  ; increment tower count
  LDI r8, 0x2200
  LOAD r0, r8
  LDI r7, 1
  ADD r0, r7
  STORE r8, r0

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r3=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r8, 0x2408
  LOAD r5, r8
  LDI r8, 0x2409
  LOAD r4, r8
  LDI r8, 0x2200
  LOAD r9, r8
  LDI r0, 0x2201
  LDI r3, 0

ctc_loop:
  JZ r9, ctc_done
  LOAD r12, r0
  MOV r8, r0
  LDI r2, 1
  ADD r8, r2
  LOAD r2, r8
  CMP r12, r5
  JNZ r6, ctc_next
  CMP r2, r4
  JNZ r6, ctc_next
  LDI r3, 1
  JMP ctc_done
ctc_next:
  LDI r2, 4
  ADD r0, r2
  LDI r2, 1
  SUB r9, r2
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r8, 0x2402
  LOAD r3, r8
  LDI r2, 1
  ADD r3, r2
  STORE r8, r3
  ; enemies_per_wave = 3 + wave*2
  MOV r12, r3
  LDI r2, 2
  MUL r12, r2
  LDI r2, 3
  ADD r12, r2
  LDI r8, 0x2406
  STORE r8, r12
  LDI r3, 1
  LDI r8, 0x2403
  STORE r8, r3
  LDI r3, 0
  LDI r8, 0x2404
  STORE r8, r3
  LDI r8, 0x2405
  STORE r8, r3
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r8, 0x2403
  LOAD r3, r8
  JZ r3, spawn_done

  LDI r8, 0x2405
  LOAD r15, r8
  LDI r8, 0x2406
  LOAD r0, r8
  CMP r15, r0
  BGE r6, spawn_check_done

  LDI r8, 0x2404
  LOAD r3, r8
  JZ r3, do_spawn
  LDI r2, 1
  SUB r3, r2
  STORE r8, r3
  JMP spawn_done

do_spawn:
  LDI r0, 0x2101
  LDI r9, 16

find_slot:
  JZ r9, spawn_done
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LOAD r8, r8
  JNZ r8, find_next

  ; spawn at wp0 center (8, 40)
  LDI r12, 8
  STORE r0, r12
  MOV r8, r0
  LDI r2, 1
  ADD r8, r2
  LDI r12, 40
  STORE r8, r12
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  ; hp = 2 + wave
  LDI r12, 0x2402
  LOAD r12, r12
  LDI r2, 2
  ADD r12, r2
  STORE r8, r12
  MOV r8, r0
  LDI r2, 3
  ADD r8, r2
  LDI r12, 1
  STORE r8, r12

  ; increment spawned
  LDI r8, 0x2405
  LOAD r12, r8
  LDI r2, 1
  ADD r12, r2
  STORE r8, r12
  ; spawn_timer = 30
  LDI r12, 30
  LDI r8, 0x2404
  STORE r8, r12
  ; increment enemy_count
  LDI r8, 0x2100
  LOAD r12, r8
  LDI r2, 1
  ADD r12, r2
  STORE r8, r12

  JMP spawn_done

find_next:
  LDI r2, 4
  ADD r0, r2
  LDI r2, 1
  SUB r9, r2
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r0, 0x2101
  LDI r9, 16
  LDI r3, 0
chk_alive:
  JZ r9, chk_done
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LOAD r8, r8
  JZ r8, chk_next
  LDI r2, 1
  ADD r3, r2
chk_next:
  LDI r2, 4
  ADD r0, r2
  LDI r2, 1
  SUB r9, r2
  JMP chk_alive
chk_done:
  JNZ r3, spawn_done
  LDI r3, 0
  LDI r8, 0x2403
  STORE r8, r3

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r0, 0x2101
  LDI r9, 16

me_loop:
  JZ r9, me_done

  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LOAD r8, r8
  JZ r8, me_next

  MOV r8, r0
  LDI r2, 3
  ADD r8, r2
  LOAD r14, r8

  LDI r2, 10
  CMP r14, r2
  BGE r6, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r12, r14
  LDI r2, 2
  MUL r12, r2
  LDI r8, 0x2001
  ADD r8, r12
  LOAD r11, r8
  LDI r2, 1
  ADD r8, r2
  LOAD r1, r8

  LOAD r5, r0
  MOV r8, r0
  LDI r2, 1
  ADD r8, r2
  LOAD r4, r8

  ; dx
  MOV r12, r11
  SUB r12, r5
  JNZ r12, me_move_h

  ; dy
  MOV r12, r1
  SUB r12, r4
  JZ r12, me_reached

  MOV r8, r12
  LDI r2, 31
  SAR r8, r2
  JZ r8, me_down
  LDI r2, 1
  SUB r4, r2
  JMP me_store
me_down:
  LDI r2, 1
  ADD r4, r2
  JMP me_store

me_move_h:
  MOV r8, r12
  LDI r2, 31
  SAR r8, r2
  JZ r8, me_right
  LDI r2, 1
  SUB r5, r2
  JMP me_store
me_right:
  LDI r2, 1
  ADD r5, r2
  JMP me_store

me_reached:
  MOV r8, r0
  LDI r2, 3
  ADD r8, r2
  LOAD r14, r8
  LDI r2, 1
  ADD r14, r2
  STORE r8, r14
  JMP me_next

enemy_escaped:
  LDI r8, 0x2401
  LOAD r12, r8
  LDI r2, 1
  SUB r12, r2
  STORE r8, r12
  JZ r12, set_game_over
  ; kill enemy
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LDI r12, 0
  STORE r8, r12
  LDI r8, 0x2100
  LOAD r12, r8
  LDI r2, 1
  SUB r12, r2
  STORE r8, r12
  JMP me_next

set_game_over:
  LDI r12, 1
  LDI r8, 0x2407
  STORE r8, r12
  JMP me_next

me_store:
  STORE r0, r5
  MOV r8, r0
  LDI r2, 1
  ADD r8, r2
  STORE r8, r4

me_next:
  LDI r2, 4
  ADD r0, r2
  LDI r2, 1
  SUB r9, r2
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r0, 0x2201
  LDI r8, 0x2200
  LOAD r9, r8

ut_loop:
  JZ r9, ut_done

  ; decrement cd
  MOV r8, r0
  LDI r2, 3
  ADD r8, r2
  LOAD r8, r8
  JZ r8, ut_ready
  LDI r2, 1
  SUB r8, r2
  MOV r12, r0
  LDI r2, 3
  ADD r12, r2
  STORE r12, r8
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r12, r0
  LDI r2, 16
  MUL r12, r2
  LDI r2, 8
  ADD r12, r2
  MOV r8, r0
  LDI r2, 1
  ADD r8, r2
  LOAD r2, r8
  LDI r7, 16
  MUL r2, r7
  LDI r7, 8
  ADD r2, r7

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r8, r0
  LDI r7, 2
  ADD r8, r7
  LOAD r8, r8
  LDI r7, 2
  CMP r8, r7
  BGE r6, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r7, 3
  CMP r8, r7
  JZ r6, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r10, 0xFFFFFFFF
  LDI r5, 0
  LDI r11, 0x2101
  LDI r1, 16

ut_sl:
  JZ r1, ut_sd
  MOV r8, r11
  LDI r7, 2
  ADD r8, r7
  LOAD r8, r8
  JZ r8, ut_sn

  LOAD r3, r11
  MOV r8, r11
  LDI r7, 1
  ADD r8, r7
  LOAD r15, r8

  MOV r8, r3
  SUB r8, r12
  MOV r7, r8
  MUL r7, r7
  MOV r4, r15
  SUB r4, r2
  MOV r8, r4
  MUL r8, r8
  ADD r7, r8

  CMP r7, r20
  BGE r6, ut_sn
  CMP r7, r10
  BGE r6, ut_sn
  MOV r10, r7
  MOV r13, r11
  LDI r5, 1

ut_sn:
  LDI r7, 4
  ADD r11, r7
  LDI r7, 1
  SUB r1, r7
  JMP ut_sl

ut_sd:
  JZ r5, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r8, r0
  LDI r7, 2
  ADD r8, r7
  LOAD r8, r8
  LDI r7, 2
  CMP r8, r7
  BGE r6, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r7, 3
  CMP r8, r7
  JZ r6, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r8, r13
  LDI r7, 2
  ADD r8, r7
  LOAD r7, r8
  CMP r7, r21
  BLT r6, ut_kill
  SUB r7, r21
  STORE r8, r7
  JMP ut_cd

ut_kill:
  LDI r7, 0
  STORE r8, r7
  LDI r8, 0x2400
  LOAD r7, r8
  LDI r12, 5
  ADD r7, r12
  STORE r8, r7
  LDI r8, 0x2100
  LOAD r7, r8
  LDI r12, 1
  SUB r7, r12
  STORE r8, r7
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r8, r0
  LDI r7, 2
  ADD r8, r7
  LOAD r8, r8
  LDI r7, 2
  CMP r8, r7
  BGE r6, ut_c2or3
  LDI r7, 20
  JMP ut_scd
ut_c2or3:
  LDI r7, 3
  CMP r8, r7
  JZ r6, ut_c3
  LDI r7, 45
  JMP ut_scd
ut_c3:
  LDI r7, 30

ut_scd:
  MOV r8, r0
  LDI r12, 3
  ADD r8, r12
  STORE r8, r7

ut_next:
  LDI r2, 4
  ADD r0, r2
  LDI r2, 1
  SUB r9, r2
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r13=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r0, 0x2301
  LDI r9, 8
cs_loop:
  JZ r9, cs_done
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LOAD r8, r8
  JNZ r8, cs_next

  LOAD r8, r13
  STORE r0, r8
  MOV r12, r0
  LDI r2, 1
  ADD r12, r2
  MOV r8, r13
  LDI r2, 1
  ADD r8, r2
  LOAD r8, r8
  STORE r12, r8
  MOV r12, r0
  LDI r2, 2
  ADD r12, r2
  LDI r8, 5
  STORE r12, r8
  JMP cs_done

cs_next:
  LDI r2, 3
  ADD r0, r2
  LDI r2, 1
  SUB r9, r2
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r0=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r0, 0x2301
  LDI r9, 8

ds_loop:
  JZ r9, ds_done

  ; check timer (offset 2 from r0)
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LOAD r8, r8
  JZ r8, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r15, r0           ; r15 = ex
  LDI r2, 3
  SUB r15, r2            ; x = ex - 3
  MOV r8, r0
  LDI r2, 1
  ADD r8, r2
  LOAD r8, r8           ; r8 = ey (NOT r0)
  LDI r2, 3
  SUB r8, r2            ; y = ey - 3
  LDI r12, 6
  LDI r2, 6
  LDI r22, 0xFFFF00
  RECTF r15, r8, r12, r2, r22

  ; decrement timer
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LOAD r12, r8
  LDI r2, 1
  SUB r12, r2
  STORE r8, r12

  JMP ds_next

ds_skip:
ds_next:
  LDI r2, 3
  ADD r0, r2
  LDI r2, 1
  SUB r9, r2
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r0, 0x2101
  LDI r9, 16

de_loop:
  JZ r9, de_done

  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LOAD r8, r8
  JZ r8, de_next

  LOAD r15, r0
  LDI r2, 3
  SUB r15, r2
  MOV r8, r0
  LDI r2, 1
  ADD r8, r2
  LOAD r8, r8
  LDI r2, 3
  SUB r8, r2
  LDI r12, 6
  LDI r2, 6
  LDI r22, 0xFF4444
  RECTF r15, r8, r12, r2, r22

de_next:
  LDI r2, 4
  ADD r0, r2
  LDI r2, 1
  SUB r9, r2
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r0, 0x2201
  LDI r8, 0x2200
  LOAD r9, r8

dt_loop:
  JZ r9, dt_done

  LOAD r15, r0
  LDI r2, 16
  MUL r15, r2
  MOV r8, r0
  LDI r2, 1
  ADD r8, r2
  LOAD r7, r8
  LDI r2, 16
  MUL r7, r2
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LOAD r8, r8

  ; color: 1=green, 2=red, 3=cyan
  LDI r2, 2
  CMP r8, r2
  BGE r6, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r2, 3
  CMP r8, r2
  JZ r6, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r12, 16
  LDI r2, 16
  RECTF r15, r7, r12, r2, r22

dt_next:
  LDI r2, 4
  ADD r0, r2
  LDI r2, 1
  SUB r9, r2
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r8, 0x2408
  LOAD r15, r8
  LDI r2, 16
  MUL r15, r2
  LDI r8, 0x2409
  LOAD r0, r8
  LDI r2, 16
  MUL r0, r2

  ; color by placing_type
  LDI r8, 0x240A
  LOAD r8, r8
  JZ r8, cur_white
  LDI r2, 2
  CMP r8, r2
  BGE r6, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r2, 3
  CMP r8, r2
  JZ r6, cur_t3
  LDI r22, 0xFF0000
  JMP cur_draw
cur_t3:
  LDI r22, 0x00FFFF
  JMP cur_draw
cur_white:
  LDI r22, 0xFFFFFF

cur_draw:
  ; top edge (y, x, 16, 2)
  LDI r12, 16
  LDI r2, 2
  RECTF r15, r0, r12, r2, r22
  ; bottom edge (y+14)
  MOV r8, r0
  LDI r2, 14
  ADD r8, r2
  RECTF r15, r8, r12, r2, r22
  ; left edge (y+2, x, 2, 12)
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  LDI r12, 2
  LDI r2, 12
  RECTF r15, r8, r12, r2, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r8, r0
  LDI r2, 2
  ADD r8, r2
  MOV r12, r15
  LDI r2, 14
  ADD r12, r2
  LDI r2, 2
  LDI r7, 12
  RECTF r12, r8, r2, r7, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r8, 0x2400
  LOAD r15, r8
  LDI r2, 200
  CMP r15, r2
  BLT r6, gold_ok
  MOV r15, r2
gold_ok:
  LDI r0, 228
  LDI r12, 8
  LDI r2, 8
  LDI r22, 0xFFCC00
  RECTF r15, r0, r12, r2, r22

  ; Lives indicator (small red squares)
  LDI r8, 0x2401
  LOAD r9, r8
  LDI r0, 100
  LDI r12, 4
  LDI r2, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r9, lives_end
  LDI r7, 228
  RECTF r0, r7, r12, r2, r22
  LDI r7, 6
  ADD r0, r7
  LDI r7, 1
  SUB r9, r7
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r8, 0x2402
  LOAD r9, r8
  LDI r0, 4
  LDI r12, 4
  LDI r2, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r9, wave_end
  LDI r7, 248
  RECTF r0, r7, r12, r2, r22
  LDI r7, 6
  ADD r0, r7
  LDI r7, 1
  SUB r9, r7
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r15, 180
  LDI r0, 228
  LDI r12, 8
  LDI r2, 8
  LDI r22, 0x00CC00
  RECTF r15, r0, r12, r2, r22
  LDI r15, 200
  LDI r22, 0xCC0000
  RECTF r15, r0, r12, r2, r22
  LDI r15, 220
  LDI r22, 0x00CCCC
  RECTF r15, r0, r12, r2, r22

  RET
