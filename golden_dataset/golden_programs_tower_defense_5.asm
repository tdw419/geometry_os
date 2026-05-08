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
  LDI r1, 0x2400
  STORE r1, r7
  LDI r7, 20
  LDI r1, 0x2401
  STORE r1, r7
  LDI r7, 0
  LDI r1, 0x2402
  STORE r1, r7
  LDI r1, 0x2403
  STORE r1, r7
  LDI r1, 0x2405
  STORE r1, r7
  LDI r1, 0x2407
  STORE r1, r7
  LDI r1, 0x2408
  STORE r1, r7
  LDI r1, 0x2409
  STORE r1, r7
  LDI r1, 0x240A
  STORE r1, r7
  LDI r1, 0x2100
  STORE r1, r7
  LDI r1, 0x2200
  STORE r1, r7
  LDI r1, 0x2300
  STORE r1, r7

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r7, 10
  LDI r1, 0x2000
  STORE r1, r7

  ; wp0 (8, 40)
  LDI r7, 8
  LDI r1, 0x2001
  STORE r1, r7
  LDI r7, 40
  LDI r1, 0x2002
  STORE r1, r7
  ; wp1 (104, 40)
  LDI r7, 104
  LDI r1, 0x2003
  STORE r1, r7
  LDI r7, 40
  LDI r1, 0x2004
  STORE r1, r7
  ; wp2 (104, 104)
  LDI r7, 104
  LDI r1, 0x2005
  STORE r1, r7
  LDI r7, 104
  LDI r1, 0x2006
  STORE r1, r7
  ; wp3 (40, 104)
  LDI r7, 40
  LDI r1, 0x2007
  STORE r1, r7
  LDI r7, 104
  LDI r1, 0x2008
  STORE r1, r7
  ; wp4 (40, 168)
  LDI r7, 40
  LDI r1, 0x2009
  STORE r1, r7
  LDI r7, 168
  LDI r1, 0x200A
  STORE r1, r7
  ; wp5 (136, 168)
  LDI r7, 136
  LDI r1, 0x200B
  STORE r1, r7
  LDI r7, 168
  LDI r1, 0x200C
  STORE r1, r7
  ; wp6 (136, 72)
  LDI r7, 136
  LDI r1, 0x200D
  STORE r1, r7
  LDI r7, 72
  LDI r1, 0x200E
  STORE r1, r7
  ; wp7 (216, 72)
  LDI r7, 216
  LDI r1, 0x200F
  STORE r1, r7
  LDI r7, 72
  LDI r1, 0x2010
  STORE r1, r7
  ; wp8 (216, 168)
  LDI r7, 216
  LDI r1, 0x2011
  STORE r1, r7
  LDI r7, 168
  LDI r1, 0x2012
  STORE r1, r7
  ; wp9 (248, 168)
  LDI r7, 248
  LDI r1, 0x2013
  STORE r1, r7
  LDI r7, 168
  LDI r1, 0x2014
  STORE r1, r7

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r1, 0x2407
  LOAD r7, r1
  JNZ r7, game_over_screen

  ; clear screen dark green
  LDI r7, 0x1A3A1A
  FILL r7

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r7, 0x1A1A3A
  LDI r3, 0
  LDI r10, 224
  LDI r6, 256
  LDI r15, 32
  RECTF r3, r10, r6, r15, r7

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
  LDI r3, 0
  LDI r10, 32
  LDI r6, 112
  LDI r15, 16
  RECTF r3, r10, r6, r15, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r3, 96
  LDI r10, 32
  LDI r6, 16
  LDI r15, 80
  RECTF r3, r10, r6, r15, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r3, 32
  LDI r10, 96
  LDI r6, 80
  LDI r15, 16
  RECTF r3, r10, r6, r15, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r3, 32
  LDI r10, 96
  LDI r6, 16
  LDI r15, 80
  RECTF r3, r10, r6, r15, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r3, 32
  LDI r10, 160
  LDI r6, 112
  LDI r15, 16
  RECTF r3, r10, r6, r15, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r3, 128
  LDI r10, 64
  LDI r6, 16
  LDI r15, 112
  RECTF r3, r10, r6, r15, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r3, 128
  LDI r10, 64
  LDI r6, 96
  LDI r15, 16
  RECTF r3, r10, r6, r15, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r3, 208
  LDI r10, 64
  LDI r6, 16
  LDI r15, 112
  RECTF r3, r10, r6, r15, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r3, 208
  LDI r10, 160
  LDI r6, 48
  LDI r15, 16
  RECTF r3, r10, r6, r15, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r3, 0
  LDI r10, 32
  LDI r6, 4
  LDI r15, 16
  RECTF r3, r10, r6, r15, r22
  LDI r22, 0xCC0000
  LDI r3, 252
  LDI r10, 160
  RECTF r3, r10, r6, r15, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r14
  JZ r14, input_done

  LDI r15, 87
  CMP r14, r15
  JZ r5, input_up
  LDI r15, 119
  CMP r14, r15
  JZ r5, input_up
  LDI r15, 83
  CMP r14, r15
  JZ r5, input_down
  LDI r15, 115
  CMP r14, r15
  JZ r5, input_down
  LDI r15, 65
  CMP r14, r15
  JZ r5, input_left
  LDI r15, 97
  CMP r14, r15
  JZ r5, input_left
  LDI r15, 68
  CMP r14, r15
  JZ r5, input_right
  LDI r15, 100
  CMP r14, r15
  JZ r5, input_right
  LDI r15, 49
  CMP r14, r15
  JZ r5, input_sel1
  LDI r15, 50
  CMP r14, r15
  JZ r5, input_sel2
  LDI r15, 51
  CMP r14, r15
  JZ r5, input_sel3
  LDI r15, 32
  CMP r14, r15
  JZ r5, input_place
  LDI r15, 78
  CMP r14, r15
  JZ r5, input_newwave
  LDI r15, 110
  CMP r14, r15
  JZ r5, input_newwave
  LDI r15, 82
  CMP r14, r15
  JZ r5, do_restart
  LDI r15, 114
  CMP r14, r15
  JZ r5, do_restart
  JMP input_done

input_up:
  LDI r1, 0x2409
  LOAD r7, r1
  JZ r7, input_done
  LDI r15, 1
  SUB r7, r15
  STORE r1, r7
  JMP input_done

input_down:
  LDI r1, 0x2409
  LOAD r7, r1
  LDI r15, 13
  CMP r7, r15
  BGE r5, input_done
  LDI r15, 1
  ADD r7, r15
  STORE r1, r7
  JMP input_done

input_left:
  LDI r1, 0x2408
  LOAD r7, r1
  JZ r7, input_done
  LDI r15, 1
  SUB r7, r15
  STORE r1, r7
  JMP input_done

input_right:
  LDI r1, 0x2408
  LOAD r7, r1
  LDI r15, 15
  CMP r7, r15
  BGE r5, input_done
  LDI r15, 1
  ADD r7, r15
  STORE r1, r7
  JMP input_done

input_sel1:
  LDI r7, 1
  LDI r1, 0x240A
  STORE r1, r7
  JMP input_done

input_sel2:
  LDI r7, 2
  LDI r1, 0x240A
  STORE r1, r7
  JMP input_done

input_sel3:
  LDI r7, 3
  LDI r1, 0x240A
  STORE r1, r7
  JMP input_done

input_newwave:
  LDI r1, 0x2403
  LOAD r7, r1
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
  LDI r1, 0x240A
  LOAD r7, r1
  JZ r7, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r15, 2
  CMP r7, r15
  BGE r5, place_type2or3
  LDI r15, 10
  JMP place_check_gold
place_type2or3:
  LDI r15, 3
  CMP r7, r15
  JZ r5, place_type3
  LDI r15, 25
  JMP place_check_gold
place_type3:
  LDI r15, 15

place_check_gold:
  ; r15=cost, r7=type
  LDI r1, 0x2400
  LOAD r3, r1
  CMP r3, r15
  BLT r5, input_done

  LDI r1, 0x2200
  LOAD r10, r1
  LDI r14, 8
  CMP r10, r14
  BGE r5, input_done

  LDI r1, 0x2409
  LOAD r14, r1
  LDI r6, 14
  CMP r14, r6
  BGE r5, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r7, input_done

  ; deduct gold
  SUB r3, r15
  LDI r1, 0x2400
  STORE r1, r3

  ; slot addr = 0x2201 + count * 4
  LDI r1, 0x2200
  LOAD r10, r1
  LDI r14, 4
  MUL r10, r14
  LDI r6, 0x2201
  ADD r6, r10

  ; cell_x
  LDI r1, 0x2408
  LOAD r10, r1
  STORE r6, r10
  LDI r14, 1
  ADD r6, r14
  ; cell_y
  LDI r1, 0x2409
  LOAD r10, r1
  STORE r6, r10
  LDI r14, 1
  ADD r6, r14
  ; type
  STORE r6, r7
  LDI r14, 1
  ADD r6, r14
  ; cd_timer = 0
  LDI r10, 0
  STORE r6, r10

  ; increment tower count
  LDI r1, 0x2200
  LOAD r10, r1
  LDI r14, 1
  ADD r10, r14
  STORE r1, r10

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r7=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r1, 0x2408
  LOAD r11, r1
  LDI r1, 0x2409
  LOAD r12, r1
  LDI r1, 0x2200
  LOAD r8, r1
  LDI r10, 0x2201
  LDI r7, 0

ctc_loop:
  JZ r8, ctc_done
  LOAD r6, r10
  MOV r1, r10
  LDI r15, 1
  ADD r1, r15
  LOAD r15, r1
  CMP r6, r11
  JNZ r5, ctc_next
  CMP r15, r12
  JNZ r5, ctc_next
  LDI r7, 1
  JMP ctc_done
ctc_next:
  LDI r15, 4
  ADD r10, r15
  LDI r15, 1
  SUB r8, r15
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r1, 0x2402
  LOAD r7, r1
  LDI r15, 1
  ADD r7, r15
  STORE r1, r7
  ; enemies_per_wave = 3 + wave*2
  MOV r6, r7
  LDI r15, 2
  MUL r6, r15
  LDI r15, 3
  ADD r6, r15
  LDI r1, 0x2406
  STORE r1, r6
  LDI r7, 1
  LDI r1, 0x2403
  STORE r1, r7
  LDI r7, 0
  LDI r1, 0x2404
  STORE r1, r7
  LDI r1, 0x2405
  STORE r1, r7
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r1, 0x2403
  LOAD r7, r1
  JZ r7, spawn_done

  LDI r1, 0x2405
  LOAD r3, r1
  LDI r1, 0x2406
  LOAD r10, r1
  CMP r3, r10
  BGE r5, spawn_check_done

  LDI r1, 0x2404
  LOAD r7, r1
  JZ r7, do_spawn
  LDI r15, 1
  SUB r7, r15
  STORE r1, r7
  JMP spawn_done

do_spawn:
  LDI r10, 0x2101
  LDI r8, 16

find_slot:
  JZ r8, spawn_done
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LOAD r1, r1
  JNZ r1, find_next

  ; spawn at wp0 center (8, 40)
  LDI r6, 8
  STORE r10, r6
  MOV r1, r10
  LDI r15, 1
  ADD r1, r15
  LDI r6, 40
  STORE r1, r6
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  ; hp = 2 + wave
  LDI r6, 0x2402
  LOAD r6, r6
  LDI r15, 2
  ADD r6, r15
  STORE r1, r6
  MOV r1, r10
  LDI r15, 3
  ADD r1, r15
  LDI r6, 1
  STORE r1, r6

  ; increment spawned
  LDI r1, 0x2405
  LOAD r6, r1
  LDI r15, 1
  ADD r6, r15
  STORE r1, r6
  ; spawn_timer = 30
  LDI r6, 30
  LDI r1, 0x2404
  STORE r1, r6
  ; increment enemy_count
  LDI r1, 0x2100
  LOAD r6, r1
  LDI r15, 1
  ADD r6, r15
  STORE r1, r6

  JMP spawn_done

find_next:
  LDI r15, 4
  ADD r10, r15
  LDI r15, 1
  SUB r8, r15
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r10, 0x2101
  LDI r8, 16
  LDI r7, 0
chk_alive:
  JZ r8, chk_done
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LOAD r1, r1
  JZ r1, chk_next
  LDI r15, 1
  ADD r7, r15
chk_next:
  LDI r15, 4
  ADD r10, r15
  LDI r15, 1
  SUB r8, r15
  JMP chk_alive
chk_done:
  JNZ r7, spawn_done
  LDI r7, 0
  LDI r1, 0x2403
  STORE r1, r7

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r10, 0x2101
  LDI r8, 16

me_loop:
  JZ r8, me_done

  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LOAD r1, r1
  JZ r1, me_next

  MOV r1, r10
  LDI r15, 3
  ADD r1, r15
  LOAD r9, r1

  LDI r15, 10
  CMP r9, r15
  BGE r5, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r6, r9
  LDI r15, 2
  MUL r6, r15
  LDI r1, 0x2001
  ADD r1, r6
  LOAD r2, r1
  LDI r15, 1
  ADD r1, r15
  LOAD r0, r1

  LOAD r11, r10
  MOV r1, r10
  LDI r15, 1
  ADD r1, r15
  LOAD r12, r1

  ; dx
  MOV r6, r2
  SUB r6, r11
  JNZ r6, me_move_h

  ; dy
  MOV r6, r0
  SUB r6, r12
  JZ r6, me_reached

  MOV r1, r6
  LDI r15, 31
  SAR r1, r15
  JZ r1, me_down
  LDI r15, 1
  SUB r12, r15
  JMP me_store
me_down:
  LDI r15, 1
  ADD r12, r15
  JMP me_store

me_move_h:
  MOV r1, r6
  LDI r15, 31
  SAR r1, r15
  JZ r1, me_right
  LDI r15, 1
  SUB r11, r15
  JMP me_store
me_right:
  LDI r15, 1
  ADD r11, r15
  JMP me_store

me_reached:
  MOV r1, r10
  LDI r15, 3
  ADD r1, r15
  LOAD r9, r1
  LDI r15, 1
  ADD r9, r15
  STORE r1, r9
  JMP me_next

enemy_escaped:
  LDI r1, 0x2401
  LOAD r6, r1
  LDI r15, 1
  SUB r6, r15
  STORE r1, r6
  JZ r6, set_game_over
  ; kill enemy
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LDI r6, 0
  STORE r1, r6
  LDI r1, 0x2100
  LOAD r6, r1
  LDI r15, 1
  SUB r6, r15
  STORE r1, r6
  JMP me_next

set_game_over:
  LDI r6, 1
  LDI r1, 0x2407
  STORE r1, r6
  JMP me_next

me_store:
  STORE r10, r11
  MOV r1, r10
  LDI r15, 1
  ADD r1, r15
  STORE r1, r12

me_next:
  LDI r15, 4
  ADD r10, r15
  LDI r15, 1
  SUB r8, r15
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r10, 0x2201
  LDI r1, 0x2200
  LOAD r8, r1

ut_loop:
  JZ r8, ut_done

  ; decrement cd
  MOV r1, r10
  LDI r15, 3
  ADD r1, r15
  LOAD r1, r1
  JZ r1, ut_ready
  LDI r15, 1
  SUB r1, r15
  MOV r6, r10
  LDI r15, 3
  ADD r6, r15
  STORE r6, r1
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r6, r10
  LDI r15, 16
  MUL r6, r15
  LDI r15, 8
  ADD r6, r15
  MOV r1, r10
  LDI r15, 1
  ADD r1, r15
  LOAD r15, r1
  LDI r14, 16
  MUL r15, r14
  LDI r14, 8
  ADD r15, r14

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r1, r10
  LDI r14, 2
  ADD r1, r14
  LOAD r1, r1
  LDI r14, 2
  CMP r1, r14
  BGE r5, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r14, 3
  CMP r1, r14
  JZ r5, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r4, 0xFFFFFFFF
  LDI r11, 0
  LDI r2, 0x2101
  LDI r0, 16

ut_sl:
  JZ r0, ut_sd
  MOV r1, r2
  LDI r14, 2
  ADD r1, r14
  LOAD r1, r1
  JZ r1, ut_sn

  LOAD r7, r2
  MOV r1, r2
  LDI r14, 1
  ADD r1, r14
  LOAD r3, r1

  MOV r1, r7
  SUB r1, r6
  MOV r14, r1
  MUL r14, r14
  MOV r12, r3
  SUB r12, r15
  MOV r1, r12
  MUL r1, r1
  ADD r14, r1

  CMP r14, r20
  BGE r5, ut_sn
  CMP r14, r4
  BGE r5, ut_sn
  MOV r4, r14
  MOV r13, r2
  LDI r11, 1

ut_sn:
  LDI r14, 4
  ADD r2, r14
  LDI r14, 1
  SUB r0, r14
  JMP ut_sl

ut_sd:
  JZ r11, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r1, r10
  LDI r14, 2
  ADD r1, r14
  LOAD r1, r1
  LDI r14, 2
  CMP r1, r14
  BGE r5, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r14, 3
  CMP r1, r14
  JZ r5, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r1, r13
  LDI r14, 2
  ADD r1, r14
  LOAD r14, r1
  CMP r14, r21
  BLT r5, ut_kill
  SUB r14, r21
  STORE r1, r14
  JMP ut_cd

ut_kill:
  LDI r14, 0
  STORE r1, r14
  LDI r1, 0x2400
  LOAD r14, r1
  LDI r6, 5
  ADD r14, r6
  STORE r1, r14
  LDI r1, 0x2100
  LOAD r14, r1
  LDI r6, 1
  SUB r14, r6
  STORE r1, r14
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r1, r10
  LDI r14, 2
  ADD r1, r14
  LOAD r1, r1
  LDI r14, 2
  CMP r1, r14
  BGE r5, ut_c2or3
  LDI r14, 20
  JMP ut_scd
ut_c2or3:
  LDI r14, 3
  CMP r1, r14
  JZ r5, ut_c3
  LDI r14, 45
  JMP ut_scd
ut_c3:
  LDI r14, 30

ut_scd:
  MOV r1, r10
  LDI r6, 3
  ADD r1, r6
  STORE r1, r14

ut_next:
  LDI r15, 4
  ADD r10, r15
  LDI r15, 1
  SUB r8, r15
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r13=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r10, 0x2301
  LDI r8, 8
cs_loop:
  JZ r8, cs_done
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LOAD r1, r1
  JNZ r1, cs_next

  LOAD r1, r13
  STORE r10, r1
  MOV r6, r10
  LDI r15, 1
  ADD r6, r15
  MOV r1, r13
  LDI r15, 1
  ADD r1, r15
  LOAD r1, r1
  STORE r6, r1
  MOV r6, r10
  LDI r15, 2
  ADD r6, r15
  LDI r1, 5
  STORE r6, r1
  JMP cs_done

cs_next:
  LDI r15, 3
  ADD r10, r15
  LDI r15, 1
  SUB r8, r15
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r10=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r10, 0x2301
  LDI r8, 8

ds_loop:
  JZ r8, ds_done

  ; check timer (offset 2 from r10)
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LOAD r1, r1
  JZ r1, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r3, r10           ; r3 = ex
  LDI r15, 3
  SUB r3, r15            ; x = ex - 3
  MOV r1, r10
  LDI r15, 1
  ADD r1, r15
  LOAD r1, r1           ; r1 = ey (NOT r10)
  LDI r15, 3
  SUB r1, r15            ; y = ey - 3
  LDI r6, 6
  LDI r15, 6
  LDI r22, 0xFFFF00
  RECTF r3, r1, r6, r15, r22

  ; decrement timer
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LOAD r6, r1
  LDI r15, 1
  SUB r6, r15
  STORE r1, r6

  JMP ds_next

ds_skip:
ds_next:
  LDI r15, 3
  ADD r10, r15
  LDI r15, 1
  SUB r8, r15
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r10, 0x2101
  LDI r8, 16

de_loop:
  JZ r8, de_done

  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LOAD r1, r1
  JZ r1, de_next

  LOAD r3, r10
  LDI r15, 3
  SUB r3, r15
  MOV r1, r10
  LDI r15, 1
  ADD r1, r15
  LOAD r1, r1
  LDI r15, 3
  SUB r1, r15
  LDI r6, 6
  LDI r15, 6
  LDI r22, 0xFF4444
  RECTF r3, r1, r6, r15, r22

de_next:
  LDI r15, 4
  ADD r10, r15
  LDI r15, 1
  SUB r8, r15
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r10, 0x2201
  LDI r1, 0x2200
  LOAD r8, r1

dt_loop:
  JZ r8, dt_done

  LOAD r3, r10
  LDI r15, 16
  MUL r3, r15
  MOV r1, r10
  LDI r15, 1
  ADD r1, r15
  LOAD r14, r1
  LDI r15, 16
  MUL r14, r15
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LOAD r1, r1

  ; color: 1=green, 2=red, 3=cyan
  LDI r15, 2
  CMP r1, r15
  BGE r5, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r15, 3
  CMP r1, r15
  JZ r5, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r6, 16
  LDI r15, 16
  RECTF r3, r14, r6, r15, r22

dt_next:
  LDI r15, 4
  ADD r10, r15
  LDI r15, 1
  SUB r8, r15
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r1, 0x2408
  LOAD r3, r1
  LDI r15, 16
  MUL r3, r15
  LDI r1, 0x2409
  LOAD r10, r1
  LDI r15, 16
  MUL r10, r15

  ; color by placing_type
  LDI r1, 0x240A
  LOAD r1, r1
  JZ r1, cur_white
  LDI r15, 2
  CMP r1, r15
  BGE r5, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r15, 3
  CMP r1, r15
  JZ r5, cur_t3
  LDI r22, 0xFF0000
  JMP cur_draw
cur_t3:
  LDI r22, 0x00FFFF
  JMP cur_draw
cur_white:
  LDI r22, 0xFFFFFF

cur_draw:
  ; top edge (y, x, 16, 2)
  LDI r6, 16
  LDI r15, 2
  RECTF r3, r10, r6, r15, r22
  ; bottom edge (y+14)
  MOV r1, r10
  LDI r15, 14
  ADD r1, r15
  RECTF r3, r1, r6, r15, r22
  ; left edge (y+2, x, 2, 12)
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  LDI r6, 2
  LDI r15, 12
  RECTF r3, r1, r6, r15, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r1, r10
  LDI r15, 2
  ADD r1, r15
  MOV r6, r3
  LDI r15, 14
  ADD r6, r15
  LDI r15, 2
  LDI r14, 12
  RECTF r6, r1, r15, r14, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r1, 0x2400
  LOAD r3, r1
  LDI r15, 200
  CMP r3, r15
  BLT r5, gold_ok
  MOV r3, r15
gold_ok:
  LDI r10, 228
  LDI r6, 8
  LDI r15, 8
  LDI r22, 0xFFCC00
  RECTF r3, r10, r6, r15, r22

  ; Lives indicator (small red squares)
  LDI r1, 0x2401
  LOAD r8, r1
  LDI r10, 100
  LDI r6, 4
  LDI r15, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r8, lives_end
  LDI r14, 228
  RECTF r10, r14, r6, r15, r22
  LDI r14, 6
  ADD r10, r14
  LDI r14, 1
  SUB r8, r14
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r1, 0x2402
  LOAD r8, r1
  LDI r10, 4
  LDI r6, 4
  LDI r15, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r8, wave_end
  LDI r14, 248
  RECTF r10, r14, r6, r15, r22
  LDI r14, 6
  ADD r10, r14
  LDI r14, 1
  SUB r8, r14
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r3, 180
  LDI r10, 228
  LDI r6, 8
  LDI r15, 8
  LDI r22, 0x00CC00
  RECTF r3, r10, r6, r15, r22
  LDI r3, 200
  LDI r22, 0xCC0000
  RECTF r3, r10, r6, r15, r22
  LDI r3, 220
  LDI r22, 0x00CCCC
  RECTF r3, r10, r6, r15, r22

  RET
