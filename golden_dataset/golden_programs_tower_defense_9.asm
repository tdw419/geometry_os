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

  LDI r7, 50
  LDI r6, 0x2400
  STORE r6, r7
  LDI r7, 20
  LDI r6, 0x2401
  STORE r6, r7
  LDI r7, 0
  LDI r6, 0x2402
  STORE r6, r7
  LDI r6, 0x2403
  STORE r6, r7
  LDI r6, 0x2405
  STORE r6, r7
  LDI r6, 0x2407
  STORE r6, r7
  LDI r6, 0x2408
  STORE r6, r7
  LDI r6, 0x2409
  STORE r6, r7
  LDI r6, 0x240A
  STORE r6, r7
  LDI r6, 0x2100
  STORE r6, r7
  LDI r6, 0x2200
  STORE r6, r7
  LDI r6, 0x2300
  STORE r6, r7

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r7, 10
  LDI r6, 0x2000
  STORE r6, r7

  ; wp0 (8, 40)
  LDI r7, 8
  LDI r6, 0x2001
  STORE r6, r7
  LDI r7, 40
  LDI r6, 0x2002
  STORE r6, r7
  ; wp1 (104, 40)
  LDI r7, 104
  LDI r6, 0x2003
  STORE r6, r7
  LDI r7, 40
  LDI r6, 0x2004
  STORE r6, r7
  ; wp2 (104, 104)
  LDI r7, 104
  LDI r6, 0x2005
  STORE r6, r7
  LDI r7, 104
  LDI r6, 0x2006
  STORE r6, r7
  ; wp3 (40, 104)
  LDI r7, 40
  LDI r6, 0x2007
  STORE r6, r7
  LDI r7, 104
  LDI r6, 0x2008
  STORE r6, r7
  ; wp4 (40, 168)
  LDI r7, 40
  LDI r6, 0x2009
  STORE r6, r7
  LDI r7, 168
  LDI r6, 0x200A
  STORE r6, r7
  ; wp5 (136, 168)
  LDI r7, 136
  LDI r6, 0x200B
  STORE r6, r7
  LDI r7, 168
  LDI r6, 0x200C
  STORE r6, r7
  ; wp6 (136, 72)
  LDI r7, 136
  LDI r6, 0x200D
  STORE r6, r7
  LDI r7, 72
  LDI r6, 0x200E
  STORE r6, r7
  ; wp7 (216, 72)
  LDI r7, 216
  LDI r6, 0x200F
  STORE r6, r7
  LDI r7, 72
  LDI r6, 0x2010
  STORE r6, r7
  ; wp8 (216, 168)
  LDI r7, 216
  LDI r6, 0x2011
  STORE r6, r7
  LDI r7, 168
  LDI r6, 0x2012
  STORE r6, r7
  ; wp9 (248, 168)
  LDI r7, 248
  LDI r6, 0x2013
  STORE r6, r7
  LDI r7, 168
  LDI r6, 0x2014
  STORE r6, r7

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r6, 0x2407
  LOAD r7, r6
  JNZ r7, game_over_screen

  ; clear screen dark green
  LDI r7, 0x1A3A1A
  FILL r7

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r7, 0x1A1A3A
  LDI r5, 0
  LDI r10, 224
  LDI r1, 256
  LDI r11, 32
  RECTF r5, r10, r1, r11, r7

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
  LDI r7, 0x550000
  FILL r7
  FRAME
  IKEY r7
  JZ r7, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r5, 0
  LDI r10, 32
  LDI r1, 112
  LDI r11, 16
  RECTF r5, r10, r1, r11, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r5, 96
  LDI r10, 32
  LDI r1, 16
  LDI r11, 80
  RECTF r5, r10, r1, r11, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r5, 32
  LDI r10, 96
  LDI r1, 80
  LDI r11, 16
  RECTF r5, r10, r1, r11, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r5, 32
  LDI r10, 96
  LDI r1, 16
  LDI r11, 80
  RECTF r5, r10, r1, r11, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r5, 32
  LDI r10, 160
  LDI r1, 112
  LDI r11, 16
  RECTF r5, r10, r1, r11, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r5, 128
  LDI r10, 64
  LDI r1, 16
  LDI r11, 112
  RECTF r5, r10, r1, r11, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r5, 128
  LDI r10, 64
  LDI r1, 96
  LDI r11, 16
  RECTF r5, r10, r1, r11, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r5, 208
  LDI r10, 64
  LDI r1, 16
  LDI r11, 112
  RECTF r5, r10, r1, r11, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r5, 208
  LDI r10, 160
  LDI r1, 48
  LDI r11, 16
  RECTF r5, r10, r1, r11, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r5, 0
  LDI r10, 32
  LDI r1, 4
  LDI r11, 16
  RECTF r5, r10, r1, r11, r22
  LDI r22, 0xCC0000
  LDI r5, 252
  LDI r10, 160
  RECTF r5, r10, r1, r11, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r15
  JZ r15, input_done

  LDI r11, 87
  CMP r15, r11
  JZ r0, input_up
  LDI r11, 119
  CMP r15, r11
  JZ r0, input_up
  LDI r11, 83
  CMP r15, r11
  JZ r0, input_down
  LDI r11, 115
  CMP r15, r11
  JZ r0, input_down
  LDI r11, 65
  CMP r15, r11
  JZ r0, input_left
  LDI r11, 97
  CMP r15, r11
  JZ r0, input_left
  LDI r11, 68
  CMP r15, r11
  JZ r0, input_right
  LDI r11, 100
  CMP r15, r11
  JZ r0, input_right
  LDI r11, 49
  CMP r15, r11
  JZ r0, input_sel1
  LDI r11, 50
  CMP r15, r11
  JZ r0, input_sel2
  LDI r11, 51
  CMP r15, r11
  JZ r0, input_sel3
  LDI r11, 32
  CMP r15, r11
  JZ r0, input_place
  LDI r11, 78
  CMP r15, r11
  JZ r0, input_newwave
  LDI r11, 110
  CMP r15, r11
  JZ r0, input_newwave
  LDI r11, 82
  CMP r15, r11
  JZ r0, do_restart
  LDI r11, 114
  CMP r15, r11
  JZ r0, do_restart
  JMP input_done

input_up:
  LDI r6, 0x2409
  LOAD r7, r6
  JZ r7, input_done
  LDI r11, 1
  SUB r7, r11
  STORE r6, r7
  JMP input_done

input_down:
  LDI r6, 0x2409
  LOAD r7, r6
  LDI r11, 13
  CMP r7, r11
  BGE r0, input_done
  LDI r11, 1
  ADD r7, r11
  STORE r6, r7
  JMP input_done

input_left:
  LDI r6, 0x2408
  LOAD r7, r6
  JZ r7, input_done
  LDI r11, 1
  SUB r7, r11
  STORE r6, r7
  JMP input_done

input_right:
  LDI r6, 0x2408
  LOAD r7, r6
  LDI r11, 15
  CMP r7, r11
  BGE r0, input_done
  LDI r11, 1
  ADD r7, r11
  STORE r6, r7
  JMP input_done

input_sel1:
  LDI r7, 1
  LDI r6, 0x240A
  STORE r6, r7
  JMP input_done

input_sel2:
  LDI r7, 2
  LDI r6, 0x240A
  STORE r6, r7
  JMP input_done

input_sel3:
  LDI r7, 3
  LDI r6, 0x240A
  STORE r6, r7
  JMP input_done

input_newwave:
  LDI r6, 0x2403
  LOAD r7, r6
  JNZ r7, input_done
  PUSH r31
  CALL start_wave
  POP r31
  JMP input_done

do_restart:
  ; POP the value game_loop pushed, then restart
  POP r31
  JMP restart

input_place:
  LDI r6, 0x240A
  LOAD r7, r6
  JZ r7, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r11, 2
  CMP r7, r11
  BGE r0, place_type2or3
  LDI r11, 10
  JMP place_check_gold
place_type2or3:
  LDI r11, 3
  CMP r7, r11
  JZ r0, place_type3
  LDI r11, 25
  JMP place_check_gold
place_type3:
  LDI r11, 15

place_check_gold:
  ; r11=cost, r7=type
  LDI r6, 0x2400
  LOAD r5, r6
  CMP r5, r11
  BLT r0, input_done

  LDI r6, 0x2200
  LOAD r10, r6
  LDI r15, 8
  CMP r10, r15
  BGE r0, input_done

  LDI r6, 0x2409
  LOAD r15, r6
  LDI r1, 14
  CMP r15, r1
  BGE r0, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r7, input_done

  ; deduct gold
  SUB r5, r11
  LDI r6, 0x2400
  STORE r6, r5

  ; slot addr = 0x2201 + count * 4
  LDI r6, 0x2200
  LOAD r10, r6
  LDI r15, 4
  MUL r10, r15
  LDI r1, 0x2201
  ADD r1, r10

  ; cell_x
  LDI r6, 0x2408
  LOAD r10, r6
  STORE r1, r10
  LDI r15, 1
  ADD r1, r15
  ; cell_y
  LDI r6, 0x2409
  LOAD r10, r6
  STORE r1, r10
  LDI r15, 1
  ADD r1, r15
  ; type
  STORE r1, r7
  LDI r15, 1
  ADD r1, r15
  ; cd_timer = 0
  LDI r10, 0
  STORE r1, r10

  ; increment tower count
  LDI r6, 0x2200
  LOAD r10, r6
  LDI r15, 1
  ADD r10, r15
  STORE r6, r10

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r7=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r6, 0x2408
  LOAD r9, r6
  LDI r6, 0x2409
  LOAD r12, r6
  LDI r6, 0x2200
  LOAD r2, r6
  LDI r10, 0x2201
  LDI r7, 0

ctc_loop:
  JZ r2, ctc_done
  LOAD r1, r10
  MOV r6, r10
  LDI r11, 1
  ADD r6, r11
  LOAD r11, r6
  CMP r1, r9
  JNZ r0, ctc_next
  CMP r11, r12
  JNZ r0, ctc_next
  LDI r7, 1
  JMP ctc_done
ctc_next:
  LDI r11, 4
  ADD r10, r11
  LDI r11, 1
  SUB r2, r11
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r6, 0x2402
  LOAD r7, r6
  LDI r11, 1
  ADD r7, r11
  STORE r6, r7
  ; enemies_per_wave = 3 + wave*2
  MOV r1, r7
  LDI r11, 2
  MUL r1, r11
  LDI r11, 3
  ADD r1, r11
  LDI r6, 0x2406
  STORE r6, r1
  LDI r7, 1
  LDI r6, 0x2403
  STORE r6, r7
  LDI r7, 0
  LDI r6, 0x2404
  STORE r6, r7
  LDI r6, 0x2405
  STORE r6, r7
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r6, 0x2403
  LOAD r7, r6
  JZ r7, spawn_done

  LDI r6, 0x2405
  LOAD r5, r6
  LDI r6, 0x2406
  LOAD r10, r6
  CMP r5, r10
  BGE r0, spawn_check_done

  LDI r6, 0x2404
  LOAD r7, r6
  JZ r7, do_spawn
  LDI r11, 1
  SUB r7, r11
  STORE r6, r7
  JMP spawn_done

do_spawn:
  LDI r10, 0x2101
  LDI r2, 16

find_slot:
  JZ r2, spawn_done
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LOAD r6, r6
  JNZ r6, find_next

  ; spawn at wp0 center (8, 40)
  LDI r1, 8
  STORE r10, r1
  MOV r6, r10
  LDI r11, 1
  ADD r6, r11
  LDI r1, 40
  STORE r6, r1
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  ; hp = 2 + wave
  LDI r1, 0x2402
  LOAD r1, r1
  LDI r11, 2
  ADD r1, r11
  STORE r6, r1
  MOV r6, r10
  LDI r11, 3
  ADD r6, r11
  LDI r1, 1
  STORE r6, r1

  ; increment spawned
  LDI r6, 0x2405
  LOAD r1, r6
  LDI r11, 1
  ADD r1, r11
  STORE r6, r1
  ; spawn_timer = 30
  LDI r1, 30
  LDI r6, 0x2404
  STORE r6, r1
  ; increment enemy_count
  LDI r6, 0x2100
  LOAD r1, r6
  LDI r11, 1
  ADD r1, r11
  STORE r6, r1

  JMP spawn_done

find_next:
  LDI r11, 4
  ADD r10, r11
  LDI r11, 1
  SUB r2, r11
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r10, 0x2101
  LDI r2, 16
  LDI r7, 0
chk_alive:
  JZ r2, chk_done
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LOAD r6, r6
  JZ r6, chk_next
  LDI r11, 1
  ADD r7, r11
chk_next:
  LDI r11, 4
  ADD r10, r11
  LDI r11, 1
  SUB r2, r11
  JMP chk_alive
chk_done:
  JNZ r7, spawn_done
  LDI r7, 0
  LDI r6, 0x2403
  STORE r6, r7

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r10, 0x2101
  LDI r2, 16

me_loop:
  JZ r2, me_done

  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LOAD r6, r6
  JZ r6, me_next

  MOV r6, r10
  LDI r11, 3
  ADD r6, r11
  LOAD r14, r6

  LDI r11, 10
  CMP r14, r11
  BGE r0, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r1, r14
  LDI r11, 2
  MUL r1, r11
  LDI r6, 0x2001
  ADD r6, r1
  LOAD r3, r6
  LDI r11, 1
  ADD r6, r11
  LOAD r8, r6

  LOAD r9, r10
  MOV r6, r10
  LDI r11, 1
  ADD r6, r11
  LOAD r12, r6

  ; dx
  MOV r1, r3
  SUB r1, r9
  JNZ r1, me_move_h

  ; dy
  MOV r1, r8
  SUB r1, r12
  JZ r1, me_reached

  MOV r6, r1
  LDI r11, 31
  SAR r6, r11
  JZ r6, me_down
  LDI r11, 1
  SUB r12, r11
  JMP me_store
me_down:
  LDI r11, 1
  ADD r12, r11
  JMP me_store

me_move_h:
  MOV r6, r1
  LDI r11, 31
  SAR r6, r11
  JZ r6, me_right
  LDI r11, 1
  SUB r9, r11
  JMP me_store
me_right:
  LDI r11, 1
  ADD r9, r11
  JMP me_store

me_reached:
  MOV r6, r10
  LDI r11, 3
  ADD r6, r11
  LOAD r14, r6
  LDI r11, 1
  ADD r14, r11
  STORE r6, r14
  JMP me_next

enemy_escaped:
  LDI r6, 0x2401
  LOAD r1, r6
  LDI r11, 1
  SUB r1, r11
  STORE r6, r1
  JZ r1, set_game_over
  ; kill enemy
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LDI r1, 0
  STORE r6, r1
  LDI r6, 0x2100
  LOAD r1, r6
  LDI r11, 1
  SUB r1, r11
  STORE r6, r1
  JMP me_next

set_game_over:
  LDI r1, 1
  LDI r6, 0x2407
  STORE r6, r1
  JMP me_next

me_store:
  STORE r10, r9
  MOV r6, r10
  LDI r11, 1
  ADD r6, r11
  STORE r6, r12

me_next:
  LDI r11, 4
  ADD r10, r11
  LDI r11, 1
  SUB r2, r11
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r10, 0x2201
  LDI r6, 0x2200
  LOAD r2, r6

ut_loop:
  JZ r2, ut_done

  ; decrement cd
  MOV r6, r10
  LDI r11, 3
  ADD r6, r11
  LOAD r6, r6
  JZ r6, ut_ready
  LDI r11, 1
  SUB r6, r11
  MOV r1, r10
  LDI r11, 3
  ADD r1, r11
  STORE r1, r6
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r1, r10
  LDI r11, 16
  MUL r1, r11
  LDI r11, 8
  ADD r1, r11
  MOV r6, r10
  LDI r11, 1
  ADD r6, r11
  LOAD r11, r6
  LDI r15, 16
  MUL r11, r15
  LDI r15, 8
  ADD r11, r15

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r6, r10
  LDI r15, 2
  ADD r6, r15
  LOAD r6, r6
  LDI r15, 2
  CMP r6, r15
  BGE r0, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r15, 3
  CMP r6, r15
  JZ r0, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r4, 0xFFFFFFFF
  LDI r9, 0
  LDI r3, 0x2101
  LDI r8, 16

ut_sl:
  JZ r8, ut_sd
  MOV r6, r3
  LDI r15, 2
  ADD r6, r15
  LOAD r6, r6
  JZ r6, ut_sn

  LOAD r7, r3
  MOV r6, r3
  LDI r15, 1
  ADD r6, r15
  LOAD r5, r6

  MOV r6, r7
  SUB r6, r1
  MOV r15, r6
  MUL r15, r15
  MOV r12, r5
  SUB r12, r11
  MOV r6, r12
  MUL r6, r6
  ADD r15, r6

  CMP r15, r20
  BGE r0, ut_sn
  CMP r15, r4
  BGE r0, ut_sn
  MOV r4, r15
  MOV r13, r3
  LDI r9, 1

ut_sn:
  LDI r15, 4
  ADD r3, r15
  LDI r15, 1
  SUB r8, r15
  JMP ut_sl

ut_sd:
  JZ r9, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r6, r10
  LDI r15, 2
  ADD r6, r15
  LOAD r6, r6
  LDI r15, 2
  CMP r6, r15
  BGE r0, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r15, 3
  CMP r6, r15
  JZ r0, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r6, r13
  LDI r15, 2
  ADD r6, r15
  LOAD r15, r6
  CMP r15, r21
  BLT r0, ut_kill
  SUB r15, r21
  STORE r6, r15
  JMP ut_cd

ut_kill:
  LDI r15, 0
  STORE r6, r15
  LDI r6, 0x2400
  LOAD r15, r6
  LDI r1, 5
  ADD r15, r1
  STORE r6, r15
  LDI r6, 0x2100
  LOAD r15, r6
  LDI r1, 1
  SUB r15, r1
  STORE r6, r15
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r6, r10
  LDI r15, 2
  ADD r6, r15
  LOAD r6, r6
  LDI r15, 2
  CMP r6, r15
  BGE r0, ut_c2or3
  LDI r15, 20
  JMP ut_scd
ut_c2or3:
  LDI r15, 3
  CMP r6, r15
  JZ r0, ut_c3
  LDI r15, 45
  JMP ut_scd
ut_c3:
  LDI r15, 30

ut_scd:
  MOV r6, r10
  LDI r1, 3
  ADD r6, r1
  STORE r6, r15

ut_next:
  LDI r11, 4
  ADD r10, r11
  LDI r11, 1
  SUB r2, r11
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r13=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r10, 0x2301
  LDI r2, 8
cs_loop:
  JZ r2, cs_done
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LOAD r6, r6
  JNZ r6, cs_next

  LOAD r6, r13
  STORE r10, r6
  MOV r1, r10
  LDI r11, 1
  ADD r1, r11
  MOV r6, r13
  LDI r11, 1
  ADD r6, r11
  LOAD r6, r6
  STORE r1, r6
  MOV r1, r10
  LDI r11, 2
  ADD r1, r11
  LDI r6, 5
  STORE r1, r6
  JMP cs_done

cs_next:
  LDI r11, 3
  ADD r10, r11
  LDI r11, 1
  SUB r2, r11
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r10=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r10, 0x2301
  LDI r2, 8

ds_loop:
  JZ r2, ds_done

  ; check timer (offset 2 from r10)
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LOAD r6, r6
  JZ r6, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r5, r10           ; r5 = ex
  LDI r11, 3
  SUB r5, r11            ; x = ex - 3
  MOV r6, r10
  LDI r11, 1
  ADD r6, r11
  LOAD r6, r6           ; r6 = ey (NOT r10)
  LDI r11, 3
  SUB r6, r11            ; y = ey - 3
  LDI r1, 6
  LDI r11, 6
  LDI r22, 0xFFFF00
  RECTF r5, r6, r1, r11, r22

  ; decrement timer
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LOAD r1, r6
  LDI r11, 1
  SUB r1, r11
  STORE r6, r1

  JMP ds_next

ds_skip:
ds_next:
  LDI r11, 3
  ADD r10, r11
  LDI r11, 1
  SUB r2, r11
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r10, 0x2101
  LDI r2, 16

de_loop:
  JZ r2, de_done

  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LOAD r6, r6
  JZ r6, de_next

  LOAD r5, r10
  LDI r11, 3
  SUB r5, r11
  MOV r6, r10
  LDI r11, 1
  ADD r6, r11
  LOAD r6, r6
  LDI r11, 3
  SUB r6, r11
  LDI r1, 6
  LDI r11, 6
  LDI r22, 0xFF4444
  RECTF r5, r6, r1, r11, r22

de_next:
  LDI r11, 4
  ADD r10, r11
  LDI r11, 1
  SUB r2, r11
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r10, 0x2201
  LDI r6, 0x2200
  LOAD r2, r6

dt_loop:
  JZ r2, dt_done

  LOAD r5, r10
  LDI r11, 16
  MUL r5, r11
  MOV r6, r10
  LDI r11, 1
  ADD r6, r11
  LOAD r15, r6
  LDI r11, 16
  MUL r15, r11
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LOAD r6, r6

  ; color: 1=green, 2=red, 3=cyan
  LDI r11, 2
  CMP r6, r11
  BGE r0, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r11, 3
  CMP r6, r11
  JZ r0, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r1, 16
  LDI r11, 16
  RECTF r5, r15, r1, r11, r22

dt_next:
  LDI r11, 4
  ADD r10, r11
  LDI r11, 1
  SUB r2, r11
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r6, 0x2408
  LOAD r5, r6
  LDI r11, 16
  MUL r5, r11
  LDI r6, 0x2409
  LOAD r10, r6
  LDI r11, 16
  MUL r10, r11

  ; color by placing_type
  LDI r6, 0x240A
  LOAD r6, r6
  JZ r6, cur_white
  LDI r11, 2
  CMP r6, r11
  BGE r0, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r11, 3
  CMP r6, r11
  JZ r0, cur_t3
  LDI r22, 0xFF0000
  JMP cur_draw
cur_t3:
  LDI r22, 0x00FFFF
  JMP cur_draw
cur_white:
  LDI r22, 0xFFFFFF

cur_draw:
  ; top edge (y, x, 16, 2)
  LDI r1, 16
  LDI r11, 2
  RECTF r5, r10, r1, r11, r22
  ; bottom edge (y+14)
  MOV r6, r10
  LDI r11, 14
  ADD r6, r11
  RECTF r5, r6, r1, r11, r22
  ; left edge (y+2, x, 2, 12)
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  LDI r1, 2
  LDI r11, 12
  RECTF r5, r6, r1, r11, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r6, r10
  LDI r11, 2
  ADD r6, r11
  MOV r1, r5
  LDI r11, 14
  ADD r1, r11
  LDI r11, 2
  LDI r15, 12
  RECTF r1, r6, r11, r15, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r6, 0x2400
  LOAD r5, r6
  LDI r11, 200
  CMP r5, r11
  BLT r0, gold_ok
  MOV r5, r11
gold_ok:
  LDI r10, 228
  LDI r1, 8
  LDI r11, 8
  LDI r22, 0xFFCC00
  RECTF r5, r10, r1, r11, r22

  ; Lives indicator (small red squares)
  LDI r6, 0x2401
  LOAD r2, r6
  LDI r10, 100
  LDI r1, 4
  LDI r11, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r2, lives_end
  LDI r15, 228
  RECTF r10, r15, r1, r11, r22
  LDI r15, 6
  ADD r10, r15
  LDI r15, 1
  SUB r2, r15
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r6, 0x2402
  LOAD r2, r6
  LDI r10, 4
  LDI r1, 4
  LDI r11, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r2, wave_end
  LDI r15, 248
  RECTF r10, r15, r1, r11, r22
  LDI r15, 6
  ADD r10, r15
  LDI r15, 1
  SUB r2, r15
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r5, 180
  LDI r10, 228
  LDI r1, 8
  LDI r11, 8
  LDI r22, 0x00CC00
  RECTF r5, r10, r1, r11, r22
  LDI r5, 200
  LDI r22, 0xCC0000
  RECTF r5, r10, r1, r11, r22
  LDI r5, 220
  LDI r22, 0x00CCCC
  RECTF r5, r10, r1, r11, r22

  RET
