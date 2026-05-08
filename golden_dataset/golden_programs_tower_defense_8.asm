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

  LDI r0, 50
  LDI r9, 0x2400
  STORE r9, r0
  LDI r0, 20
  LDI r9, 0x2401
  STORE r9, r0
  LDI r0, 0
  LDI r9, 0x2402
  STORE r9, r0
  LDI r9, 0x2403
  STORE r9, r0
  LDI r9, 0x2405
  STORE r9, r0
  LDI r9, 0x2407
  STORE r9, r0
  LDI r9, 0x2408
  STORE r9, r0
  LDI r9, 0x2409
  STORE r9, r0
  LDI r9, 0x240A
  STORE r9, r0
  LDI r9, 0x2100
  STORE r9, r0
  LDI r9, 0x2200
  STORE r9, r0
  LDI r9, 0x2300
  STORE r9, r0

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r0, 10
  LDI r9, 0x2000
  STORE r9, r0

  ; wp0 (8, 40)
  LDI r0, 8
  LDI r9, 0x2001
  STORE r9, r0
  LDI r0, 40
  LDI r9, 0x2002
  STORE r9, r0
  ; wp1 (104, 40)
  LDI r0, 104
  LDI r9, 0x2003
  STORE r9, r0
  LDI r0, 40
  LDI r9, 0x2004
  STORE r9, r0
  ; wp2 (104, 104)
  LDI r0, 104
  LDI r9, 0x2005
  STORE r9, r0
  LDI r0, 104
  LDI r9, 0x2006
  STORE r9, r0
  ; wp3 (40, 104)
  LDI r0, 40
  LDI r9, 0x2007
  STORE r9, r0
  LDI r0, 104
  LDI r9, 0x2008
  STORE r9, r0
  ; wp4 (40, 168)
  LDI r0, 40
  LDI r9, 0x2009
  STORE r9, r0
  LDI r0, 168
  LDI r9, 0x200A
  STORE r9, r0
  ; wp5 (136, 168)
  LDI r0, 136
  LDI r9, 0x200B
  STORE r9, r0
  LDI r0, 168
  LDI r9, 0x200C
  STORE r9, r0
  ; wp6 (136, 72)
  LDI r0, 136
  LDI r9, 0x200D
  STORE r9, r0
  LDI r0, 72
  LDI r9, 0x200E
  STORE r9, r0
  ; wp7 (216, 72)
  LDI r0, 216
  LDI r9, 0x200F
  STORE r9, r0
  LDI r0, 72
  LDI r9, 0x2010
  STORE r9, r0
  ; wp8 (216, 168)
  LDI r0, 216
  LDI r9, 0x2011
  STORE r9, r0
  LDI r0, 168
  LDI r9, 0x2012
  STORE r9, r0
  ; wp9 (248, 168)
  LDI r0, 248
  LDI r9, 0x2013
  STORE r9, r0
  LDI r0, 168
  LDI r9, 0x2014
  STORE r9, r0

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r9, 0x2407
  LOAD r0, r9
  JNZ r0, game_over_screen

  ; clear screen dark green
  LDI r0, 0x1A3A1A
  FILL r0

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r0, 0x1A1A3A
  LDI r1, 0
  LDI r15, 224
  LDI r5, 256
  LDI r8, 32
  RECTF r1, r15, r5, r8, r0

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
  LDI r0, 0x550000
  FILL r0
  FRAME
  IKEY r0
  JZ r0, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r1, 0
  LDI r15, 32
  LDI r5, 112
  LDI r8, 16
  RECTF r1, r15, r5, r8, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r1, 96
  LDI r15, 32
  LDI r5, 16
  LDI r8, 80
  RECTF r1, r15, r5, r8, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r1, 32
  LDI r15, 96
  LDI r5, 80
  LDI r8, 16
  RECTF r1, r15, r5, r8, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r1, 32
  LDI r15, 96
  LDI r5, 16
  LDI r8, 80
  RECTF r1, r15, r5, r8, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r1, 32
  LDI r15, 160
  LDI r5, 112
  LDI r8, 16
  RECTF r1, r15, r5, r8, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r1, 128
  LDI r15, 64
  LDI r5, 16
  LDI r8, 112
  RECTF r1, r15, r5, r8, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r1, 128
  LDI r15, 64
  LDI r5, 96
  LDI r8, 16
  RECTF r1, r15, r5, r8, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r1, 208
  LDI r15, 64
  LDI r5, 16
  LDI r8, 112
  RECTF r1, r15, r5, r8, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r1, 208
  LDI r15, 160
  LDI r5, 48
  LDI r8, 16
  RECTF r1, r15, r5, r8, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r1, 0
  LDI r15, 32
  LDI r5, 4
  LDI r8, 16
  RECTF r1, r15, r5, r8, r22
  LDI r22, 0xCC0000
  LDI r1, 252
  LDI r15, 160
  RECTF r1, r15, r5, r8, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r13
  JZ r13, input_done

  LDI r8, 87
  CMP r13, r8
  JZ r3, input_up
  LDI r8, 119
  CMP r13, r8
  JZ r3, input_up
  LDI r8, 83
  CMP r13, r8
  JZ r3, input_down
  LDI r8, 115
  CMP r13, r8
  JZ r3, input_down
  LDI r8, 65
  CMP r13, r8
  JZ r3, input_left
  LDI r8, 97
  CMP r13, r8
  JZ r3, input_left
  LDI r8, 68
  CMP r13, r8
  JZ r3, input_right
  LDI r8, 100
  CMP r13, r8
  JZ r3, input_right
  LDI r8, 49
  CMP r13, r8
  JZ r3, input_sel1
  LDI r8, 50
  CMP r13, r8
  JZ r3, input_sel2
  LDI r8, 51
  CMP r13, r8
  JZ r3, input_sel3
  LDI r8, 32
  CMP r13, r8
  JZ r3, input_place
  LDI r8, 78
  CMP r13, r8
  JZ r3, input_newwave
  LDI r8, 110
  CMP r13, r8
  JZ r3, input_newwave
  LDI r8, 82
  CMP r13, r8
  JZ r3, do_restart
  LDI r8, 114
  CMP r13, r8
  JZ r3, do_restart
  JMP input_done

input_up:
  LDI r9, 0x2409
  LOAD r0, r9
  JZ r0, input_done
  LDI r8, 1
  SUB r0, r8
  STORE r9, r0
  JMP input_done

input_down:
  LDI r9, 0x2409
  LOAD r0, r9
  LDI r8, 13
  CMP r0, r8
  BGE r3, input_done
  LDI r8, 1
  ADD r0, r8
  STORE r9, r0
  JMP input_done

input_left:
  LDI r9, 0x2408
  LOAD r0, r9
  JZ r0, input_done
  LDI r8, 1
  SUB r0, r8
  STORE r9, r0
  JMP input_done

input_right:
  LDI r9, 0x2408
  LOAD r0, r9
  LDI r8, 15
  CMP r0, r8
  BGE r3, input_done
  LDI r8, 1
  ADD r0, r8
  STORE r9, r0
  JMP input_done

input_sel1:
  LDI r0, 1
  LDI r9, 0x240A
  STORE r9, r0
  JMP input_done

input_sel2:
  LDI r0, 2
  LDI r9, 0x240A
  STORE r9, r0
  JMP input_done

input_sel3:
  LDI r0, 3
  LDI r9, 0x240A
  STORE r9, r0
  JMP input_done

input_newwave:
  LDI r9, 0x2403
  LOAD r0, r9
  JNZ r0, input_done
  PUSH r31
  CALL start_wave
  POP r31
  JMP input_done

do_restart:
  ; POP the value game_loop pushed, then restart
  POP r31
  JMP restart

input_place:
  LDI r9, 0x240A
  LOAD r0, r9
  JZ r0, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r8, 2
  CMP r0, r8
  BGE r3, place_type2or3
  LDI r8, 10
  JMP place_check_gold
place_type2or3:
  LDI r8, 3
  CMP r0, r8
  JZ r3, place_type3
  LDI r8, 25
  JMP place_check_gold
place_type3:
  LDI r8, 15

place_check_gold:
  ; r8=cost, r0=type
  LDI r9, 0x2400
  LOAD r1, r9
  CMP r1, r8
  BLT r3, input_done

  LDI r9, 0x2200
  LOAD r15, r9
  LDI r13, 8
  CMP r15, r13
  BGE r3, input_done

  LDI r9, 0x2409
  LOAD r13, r9
  LDI r5, 14
  CMP r13, r5
  BGE r3, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r0, input_done

  ; deduct gold
  SUB r1, r8
  LDI r9, 0x2400
  STORE r9, r1

  ; slot addr = 0x2201 + count * 4
  LDI r9, 0x2200
  LOAD r15, r9
  LDI r13, 4
  MUL r15, r13
  LDI r5, 0x2201
  ADD r5, r15

  ; cell_x
  LDI r9, 0x2408
  LOAD r15, r9
  STORE r5, r15
  LDI r13, 1
  ADD r5, r13
  ; cell_y
  LDI r9, 0x2409
  LOAD r15, r9
  STORE r5, r15
  LDI r13, 1
  ADD r5, r13
  ; type
  STORE r5, r0
  LDI r13, 1
  ADD r5, r13
  ; cd_timer = 0
  LDI r15, 0
  STORE r5, r15

  ; increment tower count
  LDI r9, 0x2200
  LOAD r15, r9
  LDI r13, 1
  ADD r15, r13
  STORE r9, r15

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r0=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r9, 0x2408
  LOAD r7, r9
  LDI r9, 0x2409
  LOAD r11, r9
  LDI r9, 0x2200
  LOAD r14, r9
  LDI r15, 0x2201
  LDI r0, 0

ctc_loop:
  JZ r14, ctc_done
  LOAD r5, r15
  MOV r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r8, r9
  CMP r5, r7
  JNZ r3, ctc_next
  CMP r8, r11
  JNZ r3, ctc_next
  LDI r0, 1
  JMP ctc_done
ctc_next:
  LDI r8, 4
  ADD r15, r8
  LDI r8, 1
  SUB r14, r8
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r9, 0x2402
  LOAD r0, r9
  LDI r8, 1
  ADD r0, r8
  STORE r9, r0
  ; enemies_per_wave = 3 + wave*2
  MOV r5, r0
  LDI r8, 2
  MUL r5, r8
  LDI r8, 3
  ADD r5, r8
  LDI r9, 0x2406
  STORE r9, r5
  LDI r0, 1
  LDI r9, 0x2403
  STORE r9, r0
  LDI r0, 0
  LDI r9, 0x2404
  STORE r9, r0
  LDI r9, 0x2405
  STORE r9, r0
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r9, 0x2403
  LOAD r0, r9
  JZ r0, spawn_done

  LDI r9, 0x2405
  LOAD r1, r9
  LDI r9, 0x2406
  LOAD r15, r9
  CMP r1, r15
  BGE r3, spawn_check_done

  LDI r9, 0x2404
  LOAD r0, r9
  JZ r0, do_spawn
  LDI r8, 1
  SUB r0, r8
  STORE r9, r0
  JMP spawn_done

do_spawn:
  LDI r15, 0x2101
  LDI r14, 16

find_slot:
  JZ r14, spawn_done
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r9, r9
  JNZ r9, find_next

  ; spawn at wp0 center (8, 40)
  LDI r5, 8
  STORE r15, r5
  MOV r9, r15
  LDI r8, 1
  ADD r9, r8
  LDI r5, 40
  STORE r9, r5
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  ; hp = 2 + wave
  LDI r5, 0x2402
  LOAD r5, r5
  LDI r8, 2
  ADD r5, r8
  STORE r9, r5
  MOV r9, r15
  LDI r8, 3
  ADD r9, r8
  LDI r5, 1
  STORE r9, r5

  ; increment spawned
  LDI r9, 0x2405
  LOAD r5, r9
  LDI r8, 1
  ADD r5, r8
  STORE r9, r5
  ; spawn_timer = 30
  LDI r5, 30
  LDI r9, 0x2404
  STORE r9, r5
  ; increment enemy_count
  LDI r9, 0x2100
  LOAD r5, r9
  LDI r8, 1
  ADD r5, r8
  STORE r9, r5

  JMP spawn_done

find_next:
  LDI r8, 4
  ADD r15, r8
  LDI r8, 1
  SUB r14, r8
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r15, 0x2101
  LDI r14, 16
  LDI r0, 0
chk_alive:
  JZ r14, chk_done
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r9, r9
  JZ r9, chk_next
  LDI r8, 1
  ADD r0, r8
chk_next:
  LDI r8, 4
  ADD r15, r8
  LDI r8, 1
  SUB r14, r8
  JMP chk_alive
chk_done:
  JNZ r0, spawn_done
  LDI r0, 0
  LDI r9, 0x2403
  STORE r9, r0

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r15, 0x2101
  LDI r14, 16

me_loop:
  JZ r14, me_done

  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r9, r9
  JZ r9, me_next

  MOV r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r12, r9

  LDI r8, 10
  CMP r12, r8
  BGE r3, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r5, r12
  LDI r8, 2
  MUL r5, r8
  LDI r9, 0x2001
  ADD r9, r5
  LOAD r6, r9
  LDI r8, 1
  ADD r9, r8
  LOAD r4, r9

  LOAD r7, r15
  MOV r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r11, r9

  ; dx
  MOV r5, r6
  SUB r5, r7
  JNZ r5, me_move_h

  ; dy
  MOV r5, r4
  SUB r5, r11
  JZ r5, me_reached

  MOV r9, r5
  LDI r8, 31
  SAR r9, r8
  JZ r9, me_down
  LDI r8, 1
  SUB r11, r8
  JMP me_store
me_down:
  LDI r8, 1
  ADD r11, r8
  JMP me_store

me_move_h:
  MOV r9, r5
  LDI r8, 31
  SAR r9, r8
  JZ r9, me_right
  LDI r8, 1
  SUB r7, r8
  JMP me_store
me_right:
  LDI r8, 1
  ADD r7, r8
  JMP me_store

me_reached:
  MOV r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r12, r9
  LDI r8, 1
  ADD r12, r8
  STORE r9, r12
  JMP me_next

enemy_escaped:
  LDI r9, 0x2401
  LOAD r5, r9
  LDI r8, 1
  SUB r5, r8
  STORE r9, r5
  JZ r5, set_game_over
  ; kill enemy
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LDI r5, 0
  STORE r9, r5
  LDI r9, 0x2100
  LOAD r5, r9
  LDI r8, 1
  SUB r5, r8
  STORE r9, r5
  JMP me_next

set_game_over:
  LDI r5, 1
  LDI r9, 0x2407
  STORE r9, r5
  JMP me_next

me_store:
  STORE r15, r7
  MOV r9, r15
  LDI r8, 1
  ADD r9, r8
  STORE r9, r11

me_next:
  LDI r8, 4
  ADD r15, r8
  LDI r8, 1
  SUB r14, r8
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r15, 0x2201
  LDI r9, 0x2200
  LOAD r14, r9

ut_loop:
  JZ r14, ut_done

  ; decrement cd
  MOV r9, r15
  LDI r8, 3
  ADD r9, r8
  LOAD r9, r9
  JZ r9, ut_ready
  LDI r8, 1
  SUB r9, r8
  MOV r5, r15
  LDI r8, 3
  ADD r5, r8
  STORE r5, r9
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r5, r15
  LDI r8, 16
  MUL r5, r8
  LDI r8, 8
  ADD r5, r8
  MOV r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r8, r9
  LDI r13, 16
  MUL r8, r13
  LDI r13, 8
  ADD r8, r13

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r9, r15
  LDI r13, 2
  ADD r9, r13
  LOAD r9, r9
  LDI r13, 2
  CMP r9, r13
  BGE r3, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r13, 3
  CMP r9, r13
  JZ r3, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r10, 0xFFFFFFFF
  LDI r7, 0
  LDI r6, 0x2101
  LDI r4, 16

ut_sl:
  JZ r4, ut_sd
  MOV r9, r6
  LDI r13, 2
  ADD r9, r13
  LOAD r9, r9
  JZ r9, ut_sn

  LOAD r0, r6
  MOV r9, r6
  LDI r13, 1
  ADD r9, r13
  LOAD r1, r9

  MOV r9, r0
  SUB r9, r5
  MOV r13, r9
  MUL r13, r13
  MOV r11, r1
  SUB r11, r8
  MOV r9, r11
  MUL r9, r9
  ADD r13, r9

  CMP r13, r20
  BGE r3, ut_sn
  CMP r13, r10
  BGE r3, ut_sn
  MOV r10, r13
  MOV r2, r6
  LDI r7, 1

ut_sn:
  LDI r13, 4
  ADD r6, r13
  LDI r13, 1
  SUB r4, r13
  JMP ut_sl

ut_sd:
  JZ r7, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r9, r15
  LDI r13, 2
  ADD r9, r13
  LOAD r9, r9
  LDI r13, 2
  CMP r9, r13
  BGE r3, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r13, 3
  CMP r9, r13
  JZ r3, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r9, r2
  LDI r13, 2
  ADD r9, r13
  LOAD r13, r9
  CMP r13, r21
  BLT r3, ut_kill
  SUB r13, r21
  STORE r9, r13
  JMP ut_cd

ut_kill:
  LDI r13, 0
  STORE r9, r13
  LDI r9, 0x2400
  LOAD r13, r9
  LDI r5, 5
  ADD r13, r5
  STORE r9, r13
  LDI r9, 0x2100
  LOAD r13, r9
  LDI r5, 1
  SUB r13, r5
  STORE r9, r13
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r9, r15
  LDI r13, 2
  ADD r9, r13
  LOAD r9, r9
  LDI r13, 2
  CMP r9, r13
  BGE r3, ut_c2or3
  LDI r13, 20
  JMP ut_scd
ut_c2or3:
  LDI r13, 3
  CMP r9, r13
  JZ r3, ut_c3
  LDI r13, 45
  JMP ut_scd
ut_c3:
  LDI r13, 30

ut_scd:
  MOV r9, r15
  LDI r5, 3
  ADD r9, r5
  STORE r9, r13

ut_next:
  LDI r8, 4
  ADD r15, r8
  LDI r8, 1
  SUB r14, r8
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r2=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r15, 0x2301
  LDI r14, 8
cs_loop:
  JZ r14, cs_done
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r9, r9
  JNZ r9, cs_next

  LOAD r9, r2
  STORE r15, r9
  MOV r5, r15
  LDI r8, 1
  ADD r5, r8
  MOV r9, r2
  LDI r8, 1
  ADD r9, r8
  LOAD r9, r9
  STORE r5, r9
  MOV r5, r15
  LDI r8, 2
  ADD r5, r8
  LDI r9, 5
  STORE r5, r9
  JMP cs_done

cs_next:
  LDI r8, 3
  ADD r15, r8
  LDI r8, 1
  SUB r14, r8
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r15=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r15, 0x2301
  LDI r14, 8

ds_loop:
  JZ r14, ds_done

  ; check timer (offset 2 from r15)
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r9, r9
  JZ r9, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r1, r15           ; r1 = ex
  LDI r8, 3
  SUB r1, r8            ; x = ex - 3
  MOV r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r9, r9           ; r9 = ey (NOT r15)
  LDI r8, 3
  SUB r9, r8            ; y = ey - 3
  LDI r5, 6
  LDI r8, 6
  LDI r22, 0xFFFF00
  RECTF r1, r9, r5, r8, r22

  ; decrement timer
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r5, r9
  LDI r8, 1
  SUB r5, r8
  STORE r9, r5

  JMP ds_next

ds_skip:
ds_next:
  LDI r8, 3
  ADD r15, r8
  LDI r8, 1
  SUB r14, r8
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r15, 0x2101
  LDI r14, 16

de_loop:
  JZ r14, de_done

  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r9, r9
  JZ r9, de_next

  LOAD r1, r15
  LDI r8, 3
  SUB r1, r8
  MOV r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r9, r9
  LDI r8, 3
  SUB r9, r8
  LDI r5, 6
  LDI r8, 6
  LDI r22, 0xFF4444
  RECTF r1, r9, r5, r8, r22

de_next:
  LDI r8, 4
  ADD r15, r8
  LDI r8, 1
  SUB r14, r8
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r15, 0x2201
  LDI r9, 0x2200
  LOAD r14, r9

dt_loop:
  JZ r14, dt_done

  LOAD r1, r15
  LDI r8, 16
  MUL r1, r8
  MOV r9, r15
  LDI r8, 1
  ADD r9, r8
  LOAD r13, r9
  LDI r8, 16
  MUL r13, r8
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LOAD r9, r9

  ; color: 1=green, 2=red, 3=cyan
  LDI r8, 2
  CMP r9, r8
  BGE r3, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r8, 3
  CMP r9, r8
  JZ r3, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r5, 16
  LDI r8, 16
  RECTF r1, r13, r5, r8, r22

dt_next:
  LDI r8, 4
  ADD r15, r8
  LDI r8, 1
  SUB r14, r8
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r9, 0x2408
  LOAD r1, r9
  LDI r8, 16
  MUL r1, r8
  LDI r9, 0x2409
  LOAD r15, r9
  LDI r8, 16
  MUL r15, r8

  ; color by placing_type
  LDI r9, 0x240A
  LOAD r9, r9
  JZ r9, cur_white
  LDI r8, 2
  CMP r9, r8
  BGE r3, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r8, 3
  CMP r9, r8
  JZ r3, cur_t3
  LDI r22, 0xFF0000
  JMP cur_draw
cur_t3:
  LDI r22, 0x00FFFF
  JMP cur_draw
cur_white:
  LDI r22, 0xFFFFFF

cur_draw:
  ; top edge (y, x, 16, 2)
  LDI r5, 16
  LDI r8, 2
  RECTF r1, r15, r5, r8, r22
  ; bottom edge (y+14)
  MOV r9, r15
  LDI r8, 14
  ADD r9, r8
  RECTF r1, r9, r5, r8, r22
  ; left edge (y+2, x, 2, 12)
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  LDI r5, 2
  LDI r8, 12
  RECTF r1, r9, r5, r8, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r9, r15
  LDI r8, 2
  ADD r9, r8
  MOV r5, r1
  LDI r8, 14
  ADD r5, r8
  LDI r8, 2
  LDI r13, 12
  RECTF r5, r9, r8, r13, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r9, 0x2400
  LOAD r1, r9
  LDI r8, 200
  CMP r1, r8
  BLT r3, gold_ok
  MOV r1, r8
gold_ok:
  LDI r15, 228
  LDI r5, 8
  LDI r8, 8
  LDI r22, 0xFFCC00
  RECTF r1, r15, r5, r8, r22

  ; Lives indicator (small red squares)
  LDI r9, 0x2401
  LOAD r14, r9
  LDI r15, 100
  LDI r5, 4
  LDI r8, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r14, lives_end
  LDI r13, 228
  RECTF r15, r13, r5, r8, r22
  LDI r13, 6
  ADD r15, r13
  LDI r13, 1
  SUB r14, r13
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r9, 0x2402
  LOAD r14, r9
  LDI r15, 4
  LDI r5, 4
  LDI r8, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r14, wave_end
  LDI r13, 248
  RECTF r15, r13, r5, r8, r22
  LDI r13, 6
  ADD r15, r13
  LDI r13, 1
  SUB r14, r13
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r1, 180
  LDI r15, 228
  LDI r5, 8
  LDI r8, 8
  LDI r22, 0x00CC00
  RECTF r1, r15, r5, r8, r22
  LDI r1, 200
  LDI r22, 0xCC0000
  RECTF r1, r15, r5, r8, r22
  LDI r1, 220
  LDI r22, 0x00CCCC
  RECTF r1, r15, r5, r8, r22

  RET
