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

  LDI r14, 50
  LDI r2, 0x2400
  STORE r2, r14
  LDI r14, 20
  LDI r2, 0x2401
  STORE r2, r14
  LDI r14, 0
  LDI r2, 0x2402
  STORE r2, r14
  LDI r2, 0x2403
  STORE r2, r14
  LDI r2, 0x2405
  STORE r2, r14
  LDI r2, 0x2407
  STORE r2, r14
  LDI r2, 0x2408
  STORE r2, r14
  LDI r2, 0x2409
  STORE r2, r14
  LDI r2, 0x240A
  STORE r2, r14
  LDI r2, 0x2100
  STORE r2, r14
  LDI r2, 0x2200
  STORE r2, r14
  LDI r2, 0x2300
  STORE r2, r14

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r14, 10
  LDI r2, 0x2000
  STORE r2, r14

  ; wp0 (8, 40)
  LDI r14, 8
  LDI r2, 0x2001
  STORE r2, r14
  LDI r14, 40
  LDI r2, 0x2002
  STORE r2, r14
  ; wp1 (104, 40)
  LDI r14, 104
  LDI r2, 0x2003
  STORE r2, r14
  LDI r14, 40
  LDI r2, 0x2004
  STORE r2, r14
  ; wp2 (104, 104)
  LDI r14, 104
  LDI r2, 0x2005
  STORE r2, r14
  LDI r14, 104
  LDI r2, 0x2006
  STORE r2, r14
  ; wp3 (40, 104)
  LDI r14, 40
  LDI r2, 0x2007
  STORE r2, r14
  LDI r14, 104
  LDI r2, 0x2008
  STORE r2, r14
  ; wp4 (40, 168)
  LDI r14, 40
  LDI r2, 0x2009
  STORE r2, r14
  LDI r14, 168
  LDI r2, 0x200A
  STORE r2, r14
  ; wp5 (136, 168)
  LDI r14, 136
  LDI r2, 0x200B
  STORE r2, r14
  LDI r14, 168
  LDI r2, 0x200C
  STORE r2, r14
  ; wp6 (136, 72)
  LDI r14, 136
  LDI r2, 0x200D
  STORE r2, r14
  LDI r14, 72
  LDI r2, 0x200E
  STORE r2, r14
  ; wp7 (216, 72)
  LDI r14, 216
  LDI r2, 0x200F
  STORE r2, r14
  LDI r14, 72
  LDI r2, 0x2010
  STORE r2, r14
  ; wp8 (216, 168)
  LDI r14, 216
  LDI r2, 0x2011
  STORE r2, r14
  LDI r14, 168
  LDI r2, 0x2012
  STORE r2, r14
  ; wp9 (248, 168)
  LDI r14, 248
  LDI r2, 0x2013
  STORE r2, r14
  LDI r14, 168
  LDI r2, 0x2014
  STORE r2, r14

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r2, 0x2407
  LOAD r14, r2
  JNZ r14, game_over_screen

  ; clear screen dark green
  LDI r14, 0x1A3A1A
  FILL r14

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r14, 0x1A1A3A
  LDI r1, 0
  LDI r13, 224
  LDI r0, 256
  LDI r7, 32
  RECTF r1, r13, r0, r7, r14

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
  LDI r14, 0x550000
  FILL r14
  FRAME
  IKEY r14
  JZ r14, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r1, 0
  LDI r13, 32
  LDI r0, 112
  LDI r7, 16
  RECTF r1, r13, r0, r7, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r1, 96
  LDI r13, 32
  LDI r0, 16
  LDI r7, 80
  RECTF r1, r13, r0, r7, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r1, 32
  LDI r13, 96
  LDI r0, 80
  LDI r7, 16
  RECTF r1, r13, r0, r7, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r1, 32
  LDI r13, 96
  LDI r0, 16
  LDI r7, 80
  RECTF r1, r13, r0, r7, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r1, 32
  LDI r13, 160
  LDI r0, 112
  LDI r7, 16
  RECTF r1, r13, r0, r7, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r1, 128
  LDI r13, 64
  LDI r0, 16
  LDI r7, 112
  RECTF r1, r13, r0, r7, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r1, 128
  LDI r13, 64
  LDI r0, 96
  LDI r7, 16
  RECTF r1, r13, r0, r7, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r1, 208
  LDI r13, 64
  LDI r0, 16
  LDI r7, 112
  RECTF r1, r13, r0, r7, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r1, 208
  LDI r13, 160
  LDI r0, 48
  LDI r7, 16
  RECTF r1, r13, r0, r7, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r1, 0
  LDI r13, 32
  LDI r0, 4
  LDI r7, 16
  RECTF r1, r13, r0, r7, r22
  LDI r22, 0xCC0000
  LDI r1, 252
  LDI r13, 160
  RECTF r1, r13, r0, r7, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r15
  JZ r15, input_done

  LDI r7, 87
  CMP r15, r7
  JZ r8, input_up
  LDI r7, 119
  CMP r15, r7
  JZ r8, input_up
  LDI r7, 83
  CMP r15, r7
  JZ r8, input_down
  LDI r7, 115
  CMP r15, r7
  JZ r8, input_down
  LDI r7, 65
  CMP r15, r7
  JZ r8, input_left
  LDI r7, 97
  CMP r15, r7
  JZ r8, input_left
  LDI r7, 68
  CMP r15, r7
  JZ r8, input_right
  LDI r7, 100
  CMP r15, r7
  JZ r8, input_right
  LDI r7, 49
  CMP r15, r7
  JZ r8, input_sel1
  LDI r7, 50
  CMP r15, r7
  JZ r8, input_sel2
  LDI r7, 51
  CMP r15, r7
  JZ r8, input_sel3
  LDI r7, 32
  CMP r15, r7
  JZ r8, input_place
  LDI r7, 78
  CMP r15, r7
  JZ r8, input_newwave
  LDI r7, 110
  CMP r15, r7
  JZ r8, input_newwave
  LDI r7, 82
  CMP r15, r7
  JZ r8, do_restart
  LDI r7, 114
  CMP r15, r7
  JZ r8, do_restart
  JMP input_done

input_up:
  LDI r2, 0x2409
  LOAD r14, r2
  JZ r14, input_done
  LDI r7, 1
  SUB r14, r7
  STORE r2, r14
  JMP input_done

input_down:
  LDI r2, 0x2409
  LOAD r14, r2
  LDI r7, 13
  CMP r14, r7
  BGE r8, input_done
  LDI r7, 1
  ADD r14, r7
  STORE r2, r14
  JMP input_done

input_left:
  LDI r2, 0x2408
  LOAD r14, r2
  JZ r14, input_done
  LDI r7, 1
  SUB r14, r7
  STORE r2, r14
  JMP input_done

input_right:
  LDI r2, 0x2408
  LOAD r14, r2
  LDI r7, 15
  CMP r14, r7
  BGE r8, input_done
  LDI r7, 1
  ADD r14, r7
  STORE r2, r14
  JMP input_done

input_sel1:
  LDI r14, 1
  LDI r2, 0x240A
  STORE r2, r14
  JMP input_done

input_sel2:
  LDI r14, 2
  LDI r2, 0x240A
  STORE r2, r14
  JMP input_done

input_sel3:
  LDI r14, 3
  LDI r2, 0x240A
  STORE r2, r14
  JMP input_done

input_newwave:
  LDI r2, 0x2403
  LOAD r14, r2
  JNZ r14, input_done
  PUSH r31
  CALL start_wave
  POP r31
  JMP input_done

do_restart:
  ; POP the value game_loop pushed, then restart
  POP r31
  JMP restart

input_place:
  LDI r2, 0x240A
  LOAD r14, r2
  JZ r14, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r7, 2
  CMP r14, r7
  BGE r8, place_type2or3
  LDI r7, 10
  JMP place_check_gold
place_type2or3:
  LDI r7, 3
  CMP r14, r7
  JZ r8, place_type3
  LDI r7, 25
  JMP place_check_gold
place_type3:
  LDI r7, 15

place_check_gold:
  ; r7=cost, r14=type
  LDI r2, 0x2400
  LOAD r1, r2
  CMP r1, r7
  BLT r8, input_done

  LDI r2, 0x2200
  LOAD r13, r2
  LDI r15, 8
  CMP r13, r15
  BGE r8, input_done

  LDI r2, 0x2409
  LOAD r15, r2
  LDI r0, 14
  CMP r15, r0
  BGE r8, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r14, input_done

  ; deduct gold
  SUB r1, r7
  LDI r2, 0x2400
  STORE r2, r1

  ; slot addr = 0x2201 + count * 4
  LDI r2, 0x2200
  LOAD r13, r2
  LDI r15, 4
  MUL r13, r15
  LDI r0, 0x2201
  ADD r0, r13

  ; cell_x
  LDI r2, 0x2408
  LOAD r13, r2
  STORE r0, r13
  LDI r15, 1
  ADD r0, r15
  ; cell_y
  LDI r2, 0x2409
  LOAD r13, r2
  STORE r0, r13
  LDI r15, 1
  ADD r0, r15
  ; type
  STORE r0, r14
  LDI r15, 1
  ADD r0, r15
  ; cd_timer = 0
  LDI r13, 0
  STORE r0, r13

  ; increment tower count
  LDI r2, 0x2200
  LOAD r13, r2
  LDI r15, 1
  ADD r13, r15
  STORE r2, r13

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r14=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r2, 0x2408
  LOAD r6, r2
  LDI r2, 0x2409
  LOAD r5, r2
  LDI r2, 0x2200
  LOAD r3, r2
  LDI r13, 0x2201
  LDI r14, 0

ctc_loop:
  JZ r3, ctc_done
  LOAD r0, r13
  MOV r2, r13
  LDI r7, 1
  ADD r2, r7
  LOAD r7, r2
  CMP r0, r6
  JNZ r8, ctc_next
  CMP r7, r5
  JNZ r8, ctc_next
  LDI r14, 1
  JMP ctc_done
ctc_next:
  LDI r7, 4
  ADD r13, r7
  LDI r7, 1
  SUB r3, r7
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r2, 0x2402
  LOAD r14, r2
  LDI r7, 1
  ADD r14, r7
  STORE r2, r14
  ; enemies_per_wave = 3 + wave*2
  MOV r0, r14
  LDI r7, 2
  MUL r0, r7
  LDI r7, 3
  ADD r0, r7
  LDI r2, 0x2406
  STORE r2, r0
  LDI r14, 1
  LDI r2, 0x2403
  STORE r2, r14
  LDI r14, 0
  LDI r2, 0x2404
  STORE r2, r14
  LDI r2, 0x2405
  STORE r2, r14
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r2, 0x2403
  LOAD r14, r2
  JZ r14, spawn_done

  LDI r2, 0x2405
  LOAD r1, r2
  LDI r2, 0x2406
  LOAD r13, r2
  CMP r1, r13
  BGE r8, spawn_check_done

  LDI r2, 0x2404
  LOAD r14, r2
  JZ r14, do_spawn
  LDI r7, 1
  SUB r14, r7
  STORE r2, r14
  JMP spawn_done

do_spawn:
  LDI r13, 0x2101
  LDI r3, 16

find_slot:
  JZ r3, spawn_done
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LOAD r2, r2
  JNZ r2, find_next

  ; spawn at wp0 center (8, 40)
  LDI r0, 8
  STORE r13, r0
  MOV r2, r13
  LDI r7, 1
  ADD r2, r7
  LDI r0, 40
  STORE r2, r0
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  ; hp = 2 + wave
  LDI r0, 0x2402
  LOAD r0, r0
  LDI r7, 2
  ADD r0, r7
  STORE r2, r0
  MOV r2, r13
  LDI r7, 3
  ADD r2, r7
  LDI r0, 1
  STORE r2, r0

  ; increment spawned
  LDI r2, 0x2405
  LOAD r0, r2
  LDI r7, 1
  ADD r0, r7
  STORE r2, r0
  ; spawn_timer = 30
  LDI r0, 30
  LDI r2, 0x2404
  STORE r2, r0
  ; increment enemy_count
  LDI r2, 0x2100
  LOAD r0, r2
  LDI r7, 1
  ADD r0, r7
  STORE r2, r0

  JMP spawn_done

find_next:
  LDI r7, 4
  ADD r13, r7
  LDI r7, 1
  SUB r3, r7
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r13, 0x2101
  LDI r3, 16
  LDI r14, 0
chk_alive:
  JZ r3, chk_done
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LOAD r2, r2
  JZ r2, chk_next
  LDI r7, 1
  ADD r14, r7
chk_next:
  LDI r7, 4
  ADD r13, r7
  LDI r7, 1
  SUB r3, r7
  JMP chk_alive
chk_done:
  JNZ r14, spawn_done
  LDI r14, 0
  LDI r2, 0x2403
  STORE r2, r14

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r13, 0x2101
  LDI r3, 16

me_loop:
  JZ r3, me_done

  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LOAD r2, r2
  JZ r2, me_next

  MOV r2, r13
  LDI r7, 3
  ADD r2, r7
  LOAD r11, r2

  LDI r7, 10
  CMP r11, r7
  BGE r8, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r0, r11
  LDI r7, 2
  MUL r0, r7
  LDI r2, 0x2001
  ADD r2, r0
  LOAD r10, r2
  LDI r7, 1
  ADD r2, r7
  LOAD r12, r2

  LOAD r6, r13
  MOV r2, r13
  LDI r7, 1
  ADD r2, r7
  LOAD r5, r2

  ; dx
  MOV r0, r10
  SUB r0, r6
  JNZ r0, me_move_h

  ; dy
  MOV r0, r12
  SUB r0, r5
  JZ r0, me_reached

  MOV r2, r0
  LDI r7, 31
  SAR r2, r7
  JZ r2, me_down
  LDI r7, 1
  SUB r5, r7
  JMP me_store
me_down:
  LDI r7, 1
  ADD r5, r7
  JMP me_store

me_move_h:
  MOV r2, r0
  LDI r7, 31
  SAR r2, r7
  JZ r2, me_right
  LDI r7, 1
  SUB r6, r7
  JMP me_store
me_right:
  LDI r7, 1
  ADD r6, r7
  JMP me_store

me_reached:
  MOV r2, r13
  LDI r7, 3
  ADD r2, r7
  LOAD r11, r2
  LDI r7, 1
  ADD r11, r7
  STORE r2, r11
  JMP me_next

enemy_escaped:
  LDI r2, 0x2401
  LOAD r0, r2
  LDI r7, 1
  SUB r0, r7
  STORE r2, r0
  JZ r0, set_game_over
  ; kill enemy
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LDI r0, 0
  STORE r2, r0
  LDI r2, 0x2100
  LOAD r0, r2
  LDI r7, 1
  SUB r0, r7
  STORE r2, r0
  JMP me_next

set_game_over:
  LDI r0, 1
  LDI r2, 0x2407
  STORE r2, r0
  JMP me_next

me_store:
  STORE r13, r6
  MOV r2, r13
  LDI r7, 1
  ADD r2, r7
  STORE r2, r5

me_next:
  LDI r7, 4
  ADD r13, r7
  LDI r7, 1
  SUB r3, r7
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r13, 0x2201
  LDI r2, 0x2200
  LOAD r3, r2

ut_loop:
  JZ r3, ut_done

  ; decrement cd
  MOV r2, r13
  LDI r7, 3
  ADD r2, r7
  LOAD r2, r2
  JZ r2, ut_ready
  LDI r7, 1
  SUB r2, r7
  MOV r0, r13
  LDI r7, 3
  ADD r0, r7
  STORE r0, r2
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r0, r13
  LDI r7, 16
  MUL r0, r7
  LDI r7, 8
  ADD r0, r7
  MOV r2, r13
  LDI r7, 1
  ADD r2, r7
  LOAD r7, r2
  LDI r15, 16
  MUL r7, r15
  LDI r15, 8
  ADD r7, r15

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r2, r13
  LDI r15, 2
  ADD r2, r15
  LOAD r2, r2
  LDI r15, 2
  CMP r2, r15
  BGE r8, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r15, 3
  CMP r2, r15
  JZ r8, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r9, 0xFFFFFFFF
  LDI r6, 0
  LDI r10, 0x2101
  LDI r12, 16

ut_sl:
  JZ r12, ut_sd
  MOV r2, r10
  LDI r15, 2
  ADD r2, r15
  LOAD r2, r2
  JZ r2, ut_sn

  LOAD r14, r10
  MOV r2, r10
  LDI r15, 1
  ADD r2, r15
  LOAD r1, r2

  MOV r2, r14
  SUB r2, r0
  MOV r15, r2
  MUL r15, r15
  MOV r5, r1
  SUB r5, r7
  MOV r2, r5
  MUL r2, r2
  ADD r15, r2

  CMP r15, r20
  BGE r8, ut_sn
  CMP r15, r9
  BGE r8, ut_sn
  MOV r9, r15
  MOV r4, r10
  LDI r6, 1

ut_sn:
  LDI r15, 4
  ADD r10, r15
  LDI r15, 1
  SUB r12, r15
  JMP ut_sl

ut_sd:
  JZ r6, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r2, r13
  LDI r15, 2
  ADD r2, r15
  LOAD r2, r2
  LDI r15, 2
  CMP r2, r15
  BGE r8, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r15, 3
  CMP r2, r15
  JZ r8, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r2, r4
  LDI r15, 2
  ADD r2, r15
  LOAD r15, r2
  CMP r15, r21
  BLT r8, ut_kill
  SUB r15, r21
  STORE r2, r15
  JMP ut_cd

ut_kill:
  LDI r15, 0
  STORE r2, r15
  LDI r2, 0x2400
  LOAD r15, r2
  LDI r0, 5
  ADD r15, r0
  STORE r2, r15
  LDI r2, 0x2100
  LOAD r15, r2
  LDI r0, 1
  SUB r15, r0
  STORE r2, r15
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r2, r13
  LDI r15, 2
  ADD r2, r15
  LOAD r2, r2
  LDI r15, 2
  CMP r2, r15
  BGE r8, ut_c2or3
  LDI r15, 20
  JMP ut_scd
ut_c2or3:
  LDI r15, 3
  CMP r2, r15
  JZ r8, ut_c3
  LDI r15, 45
  JMP ut_scd
ut_c3:
  LDI r15, 30

ut_scd:
  MOV r2, r13
  LDI r0, 3
  ADD r2, r0
  STORE r2, r15

ut_next:
  LDI r7, 4
  ADD r13, r7
  LDI r7, 1
  SUB r3, r7
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r4=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r13, 0x2301
  LDI r3, 8
cs_loop:
  JZ r3, cs_done
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LOAD r2, r2
  JNZ r2, cs_next

  LOAD r2, r4
  STORE r13, r2
  MOV r0, r13
  LDI r7, 1
  ADD r0, r7
  MOV r2, r4
  LDI r7, 1
  ADD r2, r7
  LOAD r2, r2
  STORE r0, r2
  MOV r0, r13
  LDI r7, 2
  ADD r0, r7
  LDI r2, 5
  STORE r0, r2
  JMP cs_done

cs_next:
  LDI r7, 3
  ADD r13, r7
  LDI r7, 1
  SUB r3, r7
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r13=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r13, 0x2301
  LDI r3, 8

ds_loop:
  JZ r3, ds_done

  ; check timer (offset 2 from r13)
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LOAD r2, r2
  JZ r2, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r1, r13           ; r1 = ex
  LDI r7, 3
  SUB r1, r7            ; x = ex - 3
  MOV r2, r13
  LDI r7, 1
  ADD r2, r7
  LOAD r2, r2           ; r2 = ey (NOT r13)
  LDI r7, 3
  SUB r2, r7            ; y = ey - 3
  LDI r0, 6
  LDI r7, 6
  LDI r22, 0xFFFF00
  RECTF r1, r2, r0, r7, r22

  ; decrement timer
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LOAD r0, r2
  LDI r7, 1
  SUB r0, r7
  STORE r2, r0

  JMP ds_next

ds_skip:
ds_next:
  LDI r7, 3
  ADD r13, r7
  LDI r7, 1
  SUB r3, r7
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r13, 0x2101
  LDI r3, 16

de_loop:
  JZ r3, de_done

  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LOAD r2, r2
  JZ r2, de_next

  LOAD r1, r13
  LDI r7, 3
  SUB r1, r7
  MOV r2, r13
  LDI r7, 1
  ADD r2, r7
  LOAD r2, r2
  LDI r7, 3
  SUB r2, r7
  LDI r0, 6
  LDI r7, 6
  LDI r22, 0xFF4444
  RECTF r1, r2, r0, r7, r22

de_next:
  LDI r7, 4
  ADD r13, r7
  LDI r7, 1
  SUB r3, r7
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r13, 0x2201
  LDI r2, 0x2200
  LOAD r3, r2

dt_loop:
  JZ r3, dt_done

  LOAD r1, r13
  LDI r7, 16
  MUL r1, r7
  MOV r2, r13
  LDI r7, 1
  ADD r2, r7
  LOAD r15, r2
  LDI r7, 16
  MUL r15, r7
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LOAD r2, r2

  ; color: 1=green, 2=red, 3=cyan
  LDI r7, 2
  CMP r2, r7
  BGE r8, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r7, 3
  CMP r2, r7
  JZ r8, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r0, 16
  LDI r7, 16
  RECTF r1, r15, r0, r7, r22

dt_next:
  LDI r7, 4
  ADD r13, r7
  LDI r7, 1
  SUB r3, r7
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r2, 0x2408
  LOAD r1, r2
  LDI r7, 16
  MUL r1, r7
  LDI r2, 0x2409
  LOAD r13, r2
  LDI r7, 16
  MUL r13, r7

  ; color by placing_type
  LDI r2, 0x240A
  LOAD r2, r2
  JZ r2, cur_white
  LDI r7, 2
  CMP r2, r7
  BGE r8, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r7, 3
  CMP r2, r7
  JZ r8, cur_t3
  LDI r22, 0xFF0000
  JMP cur_draw
cur_t3:
  LDI r22, 0x00FFFF
  JMP cur_draw
cur_white:
  LDI r22, 0xFFFFFF

cur_draw:
  ; top edge (y, x, 16, 2)
  LDI r0, 16
  LDI r7, 2
  RECTF r1, r13, r0, r7, r22
  ; bottom edge (y+14)
  MOV r2, r13
  LDI r7, 14
  ADD r2, r7
  RECTF r1, r2, r0, r7, r22
  ; left edge (y+2, x, 2, 12)
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  LDI r0, 2
  LDI r7, 12
  RECTF r1, r2, r0, r7, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r2, r13
  LDI r7, 2
  ADD r2, r7
  MOV r0, r1
  LDI r7, 14
  ADD r0, r7
  LDI r7, 2
  LDI r15, 12
  RECTF r0, r2, r7, r15, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r2, 0x2400
  LOAD r1, r2
  LDI r7, 200
  CMP r1, r7
  BLT r8, gold_ok
  MOV r1, r7
gold_ok:
  LDI r13, 228
  LDI r0, 8
  LDI r7, 8
  LDI r22, 0xFFCC00
  RECTF r1, r13, r0, r7, r22

  ; Lives indicator (small red squares)
  LDI r2, 0x2401
  LOAD r3, r2
  LDI r13, 100
  LDI r0, 4
  LDI r7, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r3, lives_end
  LDI r15, 228
  RECTF r13, r15, r0, r7, r22
  LDI r15, 6
  ADD r13, r15
  LDI r15, 1
  SUB r3, r15
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r2, 0x2402
  LOAD r3, r2
  LDI r13, 4
  LDI r0, 4
  LDI r7, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r3, wave_end
  LDI r15, 248
  RECTF r13, r15, r0, r7, r22
  LDI r15, 6
  ADD r13, r15
  LDI r15, 1
  SUB r3, r15
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r1, 180
  LDI r13, 228
  LDI r0, 8
  LDI r7, 8
  LDI r22, 0x00CC00
  RECTF r1, r13, r0, r7, r22
  LDI r1, 200
  LDI r22, 0xCC0000
  RECTF r1, r13, r0, r7, r22
  LDI r1, 220
  LDI r22, 0x00CCCC
  RECTF r1, r13, r0, r7, r22

  RET
