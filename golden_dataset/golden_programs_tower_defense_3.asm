; DESCRIPTION: A red object centered at the screen with fixed size.

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

  LDI r10, 50
  LDI r13, 0x2400
  STORE r13, r10
  LDI r10, 20
  LDI r13, 0x2401
  STORE r13, r10
  LDI r10, 0
  LDI r13, 0x2402
  STORE r13, r10
  LDI r13, 0x2403
  STORE r13, r10
  LDI r13, 0x2405
  STORE r13, r10
  LDI r13, 0x2407
  STORE r13, r10
  LDI r13, 0x2408
  STORE r13, r10
  LDI r13, 0x2409
  STORE r13, r10
  LDI r13, 0x240A
  STORE r13, r10
  LDI r13, 0x2100
  STORE r13, r10
  LDI r13, 0x2200
  STORE r13, r10
  LDI r13, 0x2300
  STORE r13, r10

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r10, 10
  LDI r13, 0x2000
  STORE r13, r10

  ; wp0 (8, 40)
  LDI r10, 8
  LDI r13, 0x2001
  STORE r13, r10
  LDI r10, 40
  LDI r13, 0x2002
  STORE r13, r10
  ; wp1 (104, 40)
  LDI r10, 104
  LDI r13, 0x2003
  STORE r13, r10
  LDI r10, 40
  LDI r13, 0x2004
  STORE r13, r10
  ; wp2 (104, 104)
  LDI r10, 104
  LDI r13, 0x2005
  STORE r13, r10
  LDI r10, 104
  LDI r13, 0x2006
  STORE r13, r10
  ; wp3 (40, 104)
  LDI r10, 40
  LDI r13, 0x2007
  STORE r13, r10
  LDI r10, 104
  LDI r13, 0x2008
  STORE r13, r10
  ; wp4 (40, 168)
  LDI r10, 40
  LDI r13, 0x2009
  STORE r13, r10
  LDI r10, 168
  LDI r13, 0x200A
  STORE r13, r10
  ; wp5 (136, 168)
  LDI r10, 136
  LDI r13, 0x200B
  STORE r13, r10
  LDI r10, 168
  LDI r13, 0x200C
  STORE r13, r10
  ; wp6 (136, 72)
  LDI r10, 136
  LDI r13, 0x200D
  STORE r13, r10
  LDI r10, 72
  LDI r13, 0x200E
  STORE r13, r10
  ; wp7 (216, 72)
  LDI r10, 216
  LDI r13, 0x200F
  STORE r13, r10
  LDI r10, 72
  LDI r13, 0x2010
  STORE r13, r10
  ; wp8 (216, 168)
  LDI r10, 216
  LDI r13, 0x2011
  STORE r13, r10
  LDI r10, 168
  LDI r13, 0x2012
  STORE r13, r10
  ; wp9 (248, 168)
  LDI r10, 248
  LDI r13, 0x2013
  STORE r13, r10
  LDI r10, 168
  LDI r13, 0x2014
  STORE r13, r10

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r13, 0x2407
  LOAD r10, r13
  JNZ r10, game_over_screen

  ; clear screen dark green
  LDI r10, 0x1A3A1A
  FILL r10

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r10, 0x1A1A3A
  LDI r14, 0
  LDI r1, 224
  LDI r8, 256
  LDI r2, 32
  RECTF r14, r1, r8, r2, r10

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
  LDI r10, 0x550000
  FILL r10
  FRAME
  IKEY r10
  JZ r10, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r14, 0
  LDI r1, 32
  LDI r8, 112
  LDI r2, 16
  RECTF r14, r1, r8, r2, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r14, 96
  LDI r1, 32
  LDI r8, 16
  LDI r2, 80
  RECTF r14, r1, r8, r2, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r14, 32
  LDI r1, 96
  LDI r8, 80
  LDI r2, 16
  RECTF r14, r1, r8, r2, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r14, 32
  LDI r1, 96
  LDI r8, 16
  LDI r2, 80
  RECTF r14, r1, r8, r2, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r14, 32
  LDI r1, 160
  LDI r8, 112
  LDI r2, 16
  RECTF r14, r1, r8, r2, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r14, 128
  LDI r1, 64
  LDI r8, 16
  LDI r2, 112
  RECTF r14, r1, r8, r2, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r14, 128
  LDI r1, 64
  LDI r8, 96
  LDI r2, 16
  RECTF r14, r1, r8, r2, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r14, 208
  LDI r1, 64
  LDI r8, 16
  LDI r2, 112
  RECTF r14, r1, r8, r2, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r14, 208
  LDI r1, 160
  LDI r8, 48
  LDI r2, 16
  RECTF r14, r1, r8, r2, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r14, 0
  LDI r1, 32
  LDI r8, 4
  LDI r2, 16
  RECTF r14, r1, r8, r2, r22
  LDI r22, 0xCC0000
  LDI r14, 252
  LDI r1, 160
  RECTF r14, r1, r8, r2, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r4
  JZ r4, input_done

  LDI r2, 87
  CMP r4, r2
  JZ r15, input_up
  LDI r2, 119
  CMP r4, r2
  JZ r15, input_up
  LDI r2, 83
  CMP r4, r2
  JZ r15, input_down
  LDI r2, 115
  CMP r4, r2
  JZ r15, input_down
  LDI r2, 65
  CMP r4, r2
  JZ r15, input_left
  LDI r2, 97
  CMP r4, r2
  JZ r15, input_left
  LDI r2, 68
  CMP r4, r2
  JZ r15, input_right
  LDI r2, 100
  CMP r4, r2
  JZ r15, input_right
  LDI r2, 49
  CMP r4, r2
  JZ r15, input_sel1
  LDI r2, 50
  CMP r4, r2
  JZ r15, input_sel2
  LDI r2, 51
  CMP r4, r2
  JZ r15, input_sel3
  LDI r2, 32
  CMP r4, r2
  JZ r15, input_place
  LDI r2, 78
  CMP r4, r2
  JZ r15, input_newwave
  LDI r2, 110
  CMP r4, r2
  JZ r15, input_newwave
  LDI r2, 82
  CMP r4, r2
  JZ r15, do_restart
  LDI r2, 114
  CMP r4, r2
  JZ r15, do_restart
  JMP input_done

input_up:
  LDI r13, 0x2409
  LOAD r10, r13
  JZ r10, input_done
  LDI r2, 1
  SUB r10, r2
  STORE r13, r10
  JMP input_done

input_down:
  LDI r13, 0x2409
  LOAD r10, r13
  LDI r2, 13
  CMP r10, r2
  BGE r15, input_done
  LDI r2, 1
  ADD r10, r2
  STORE r13, r10
  JMP input_done

input_left:
  LDI r13, 0x2408
  LOAD r10, r13
  JZ r10, input_done
  LDI r2, 1
  SUB r10, r2
  STORE r13, r10
  JMP input_done

input_right:
  LDI r13, 0x2408
  LOAD r10, r13
  LDI r2, 15
  CMP r10, r2
  BGE r15, input_done
  LDI r2, 1
  ADD r10, r2
  STORE r13, r10
  JMP input_done

input_sel1:
  LDI r10, 1
  LDI r13, 0x240A
  STORE r13, r10
  JMP input_done

input_sel2:
  LDI r10, 2
  LDI r13, 0x240A
  STORE r13, r10
  JMP input_done

input_sel3:
  LDI r10, 3
  LDI r13, 0x240A
  STORE r13, r10
  JMP input_done

input_newwave:
  LDI r13, 0x2403
  LOAD r10, r13
  JNZ r10, input_done
  PUSH r31
  CALL start_wave
  POP r31
  JMP input_done

do_restart:
  ; POP the value game_loop pushed, then restart
  POP r31
  JMP restart

input_place:
  LDI r13, 0x240A
  LOAD r10, r13
  JZ r10, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r2, 2
  CMP r10, r2
  BGE r15, place_type2or3
  LDI r2, 10
  JMP place_check_gold
place_type2or3:
  LDI r2, 3
  CMP r10, r2
  JZ r15, place_type3
  LDI r2, 25
  JMP place_check_gold
place_type3:
  LDI r2, 15

place_check_gold:
  ; r2=cost, r10=type
  LDI r13, 0x2400
  LOAD r14, r13
  CMP r14, r2
  BLT r15, input_done

  LDI r13, 0x2200
  LOAD r1, r13
  LDI r4, 8
  CMP r1, r4
  BGE r15, input_done

  LDI r13, 0x2409
  LOAD r4, r13
  LDI r8, 14
  CMP r4, r8
  BGE r15, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r10, input_done

  ; deduct gold
  SUB r14, r2
  LDI r13, 0x2400
  STORE r13, r14

  ; slot addr = 0x2201 + count * 4
  LDI r13, 0x2200
  LOAD r1, r13
  LDI r4, 4
  MUL r1, r4
  LDI r8, 0x2201
  ADD r8, r1

  ; cell_x
  LDI r13, 0x2408
  LOAD r1, r13
  STORE r8, r1
  LDI r4, 1
  ADD r8, r4
  ; cell_y
  LDI r13, 0x2409
  LOAD r1, r13
  STORE r8, r1
  LDI r4, 1
  ADD r8, r4
  ; type
  STORE r8, r10
  LDI r4, 1
  ADD r8, r4
  ; cd_timer = 0
  LDI r1, 0
  STORE r8, r1

  ; increment tower count
  LDI r13, 0x2200
  LOAD r1, r13
  LDI r4, 1
  ADD r1, r4
  STORE r13, r1

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r10=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r13, 0x2408
  LOAD r9, r13
  LDI r13, 0x2409
  LOAD r11, r13
  LDI r13, 0x2200
  LOAD r5, r13
  LDI r1, 0x2201
  LDI r10, 0

ctc_loop:
  JZ r5, ctc_done
  LOAD r8, r1
  MOV r13, r1
  LDI r2, 1
  ADD r13, r2
  LOAD r2, r13
  CMP r8, r9
  JNZ r15, ctc_next
  CMP r2, r11
  JNZ r15, ctc_next
  LDI r10, 1
  JMP ctc_done
ctc_next:
  LDI r2, 4
  ADD r1, r2
  LDI r2, 1
  SUB r5, r2
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r13, 0x2402
  LOAD r10, r13
  LDI r2, 1
  ADD r10, r2
  STORE r13, r10
  ; enemies_per_wave = 3 + wave*2
  MOV r8, r10
  LDI r2, 2
  MUL r8, r2
  LDI r2, 3
  ADD r8, r2
  LDI r13, 0x2406
  STORE r13, r8
  LDI r10, 1
  LDI r13, 0x2403
  STORE r13, r10
  LDI r10, 0
  LDI r13, 0x2404
  STORE r13, r10
  LDI r13, 0x2405
  STORE r13, r10
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r13, 0x2403
  LOAD r10, r13
  JZ r10, spawn_done

  LDI r13, 0x2405
  LOAD r14, r13
  LDI r13, 0x2406
  LOAD r1, r13
  CMP r14, r1
  BGE r15, spawn_check_done

  LDI r13, 0x2404
  LOAD r10, r13
  JZ r10, do_spawn
  LDI r2, 1
  SUB r10, r2
  STORE r13, r10
  JMP spawn_done

do_spawn:
  LDI r1, 0x2101
  LDI r5, 16

find_slot:
  JZ r5, spawn_done
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LOAD r13, r13
  JNZ r13, find_next

  ; spawn at wp0 center (8, 40)
  LDI r8, 8
  STORE r1, r8
  MOV r13, r1
  LDI r2, 1
  ADD r13, r2
  LDI r8, 40
  STORE r13, r8
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  ; hp = 2 + wave
  LDI r8, 0x2402
  LOAD r8, r8
  LDI r2, 2
  ADD r8, r2
  STORE r13, r8
  MOV r13, r1
  LDI r2, 3
  ADD r13, r2
  LDI r8, 1
  STORE r13, r8

  ; increment spawned
  LDI r13, 0x2405
  LOAD r8, r13
  LDI r2, 1
  ADD r8, r2
  STORE r13, r8
  ; spawn_timer = 30
  LDI r8, 30
  LDI r13, 0x2404
  STORE r13, r8
  ; increment enemy_count
  LDI r13, 0x2100
  LOAD r8, r13
  LDI r2, 1
  ADD r8, r2
  STORE r13, r8

  JMP spawn_done

find_next:
  LDI r2, 4
  ADD r1, r2
  LDI r2, 1
  SUB r5, r2
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r1, 0x2101
  LDI r5, 16
  LDI r10, 0
chk_alive:
  JZ r5, chk_done
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LOAD r13, r13
  JZ r13, chk_next
  LDI r2, 1
  ADD r10, r2
chk_next:
  LDI r2, 4
  ADD r1, r2
  LDI r2, 1
  SUB r5, r2
  JMP chk_alive
chk_done:
  JNZ r10, spawn_done
  LDI r10, 0
  LDI r13, 0x2403
  STORE r13, r10

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r1, 0x2101
  LDI r5, 16

me_loop:
  JZ r5, me_done

  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LOAD r13, r13
  JZ r13, me_next

  MOV r13, r1
  LDI r2, 3
  ADD r13, r2
  LOAD r12, r13

  LDI r2, 10
  CMP r12, r2
  BGE r15, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r8, r12
  LDI r2, 2
  MUL r8, r2
  LDI r13, 0x2001
  ADD r13, r8
  LOAD r7, r13
  LDI r2, 1
  ADD r13, r2
  LOAD r6, r13

  LOAD r9, r1
  MOV r13, r1
  LDI r2, 1
  ADD r13, r2
  LOAD r11, r13

  ; dx
  MOV r8, r7
  SUB r8, r9
  JNZ r8, me_move_h

  ; dy
  MOV r8, r6
  SUB r8, r11
  JZ r8, me_reached

  MOV r13, r8
  LDI r2, 31
  SAR r13, r2
  JZ r13, me_down
  LDI r2, 1
  SUB r11, r2
  JMP me_store
me_down:
  LDI r2, 1
  ADD r11, r2
  JMP me_store

me_move_h:
  MOV r13, r8
  LDI r2, 31
  SAR r13, r2
  JZ r13, me_right
  LDI r2, 1
  SUB r9, r2
  JMP me_store
me_right:
  LDI r2, 1
  ADD r9, r2
  JMP me_store

me_reached:
  MOV r13, r1
  LDI r2, 3
  ADD r13, r2
  LOAD r12, r13
  LDI r2, 1
  ADD r12, r2
  STORE r13, r12
  JMP me_next

enemy_escaped:
  LDI r13, 0x2401
  LOAD r8, r13
  LDI r2, 1
  SUB r8, r2
  STORE r13, r8
  JZ r8, set_game_over
  ; kill enemy
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LDI r8, 0
  STORE r13, r8
  LDI r13, 0x2100
  LOAD r8, r13
  LDI r2, 1
  SUB r8, r2
  STORE r13, r8
  JMP me_next

set_game_over:
  LDI r8, 1
  LDI r13, 0x2407
  STORE r13, r8
  JMP me_next

me_store:
  STORE r1, r9
  MOV r13, r1
  LDI r2, 1
  ADD r13, r2
  STORE r13, r11

me_next:
  LDI r2, 4
  ADD r1, r2
  LDI r2, 1
  SUB r5, r2
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r1, 0x2201
  LDI r13, 0x2200
  LOAD r5, r13

ut_loop:
  JZ r5, ut_done

  ; decrement cd
  MOV r13, r1
  LDI r2, 3
  ADD r13, r2
  LOAD r13, r13
  JZ r13, ut_ready
  LDI r2, 1
  SUB r13, r2
  MOV r8, r1
  LDI r2, 3
  ADD r8, r2
  STORE r8, r13
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r8, r1
  LDI r2, 16
  MUL r8, r2
  LDI r2, 8
  ADD r8, r2
  MOV r13, r1
  LDI r2, 1
  ADD r13, r2
  LOAD r2, r13
  LDI r4, 16
  MUL r2, r4
  LDI r4, 8
  ADD r2, r4

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r13, r1
  LDI r4, 2
  ADD r13, r4
  LOAD r13, r13
  LDI r4, 2
  CMP r13, r4
  BGE r15, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r4, 3
  CMP r13, r4
  JZ r15, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r0, 0xFFFFFFFF
  LDI r9, 0
  LDI r7, 0x2101
  LDI r6, 16

ut_sl:
  JZ r6, ut_sd
  MOV r13, r7
  LDI r4, 2
  ADD r13, r4
  LOAD r13, r13
  JZ r13, ut_sn

  LOAD r10, r7
  MOV r13, r7
  LDI r4, 1
  ADD r13, r4
  LOAD r14, r13

  MOV r13, r10
  SUB r13, r8
  MOV r4, r13
  MUL r4, r4
  MOV r11, r14
  SUB r11, r2
  MOV r13, r11
  MUL r13, r13
  ADD r4, r13

  CMP r4, r20
  BGE r15, ut_sn
  CMP r4, r0
  BGE r15, ut_sn
  MOV r0, r4
  MOV r3, r7
  LDI r9, 1

ut_sn:
  LDI r4, 4
  ADD r7, r4
  LDI r4, 1
  SUB r6, r4
  JMP ut_sl

ut_sd:
  JZ r9, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r13, r1
  LDI r4, 2
  ADD r13, r4
  LOAD r13, r13
  LDI r4, 2
  CMP r13, r4
  BGE r15, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r4, 3
  CMP r13, r4
  JZ r15, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r13, r3
  LDI r4, 2
  ADD r13, r4
  LOAD r4, r13
  CMP r4, r21
  BLT r15, ut_kill
  SUB r4, r21
  STORE r13, r4
  JMP ut_cd

ut_kill:
  LDI r4, 0
  STORE r13, r4
  LDI r13, 0x2400
  LOAD r4, r13
  LDI r8, 5
  ADD r4, r8
  STORE r13, r4
  LDI r13, 0x2100
  LOAD r4, r13
  LDI r8, 1
  SUB r4, r8
  STORE r13, r4
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r13, r1
  LDI r4, 2
  ADD r13, r4
  LOAD r13, r13
  LDI r4, 2
  CMP r13, r4
  BGE r15, ut_c2or3
  LDI r4, 20
  JMP ut_scd
ut_c2or3:
  LDI r4, 3
  CMP r13, r4
  JZ r15, ut_c3
  LDI r4, 45
  JMP ut_scd
ut_c3:
  LDI r4, 30

ut_scd:
  MOV r13, r1
  LDI r8, 3
  ADD r13, r8
  STORE r13, r4

ut_next:
  LDI r2, 4
  ADD r1, r2
  LDI r2, 1
  SUB r5, r2
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r3=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r1, 0x2301
  LDI r5, 8
cs_loop:
  JZ r5, cs_done
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LOAD r13, r13
  JNZ r13, cs_next

  LOAD r13, r3
  STORE r1, r13
  MOV r8, r1
  LDI r2, 1
  ADD r8, r2
  MOV r13, r3
  LDI r2, 1
  ADD r13, r2
  LOAD r13, r13
  STORE r8, r13
  MOV r8, r1
  LDI r2, 2
  ADD r8, r2
  LDI r13, 5
  STORE r8, r13
  JMP cs_done

cs_next:
  LDI r2, 3
  ADD r1, r2
  LDI r2, 1
  SUB r5, r2
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r1=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r1, 0x2301
  LDI r5, 8

ds_loop:
  JZ r5, ds_done

  ; check timer (offset 2 from r1)
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LOAD r13, r13
  JZ r13, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r14, r1           ; r14 = ex
  LDI r2, 3
  SUB r14, r2            ; x = ex - 3
  MOV r13, r1
  LDI r2, 1
  ADD r13, r2
  LOAD r13, r13           ; r13 = ey (NOT r1)
  LDI r2, 3
  SUB r13, r2            ; y = ey - 3
  LDI r8, 6
  LDI r2, 6
  LDI r22, 0xFFFF00
  RECTF r14, r13, r8, r2, r22

  ; decrement timer
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LOAD r8, r13
  LDI r2, 1
  SUB r8, r2
  STORE r13, r8

  JMP ds_next

ds_skip:
ds_next:
  LDI r2, 3
  ADD r1, r2
  LDI r2, 1
  SUB r5, r2
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r1, 0x2101
  LDI r5, 16

de_loop:
  JZ r5, de_done

  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LOAD r13, r13
  JZ r13, de_next

  LOAD r14, r1
  LDI r2, 3
  SUB r14, r2
  MOV r13, r1
  LDI r2, 1
  ADD r13, r2
  LOAD r13, r13
  LDI r2, 3
  SUB r13, r2
  LDI r8, 6
  LDI r2, 6
  LDI r22, 0xFF4444
  RECTF r14, r13, r8, r2, r22

de_next:
  LDI r2, 4
  ADD r1, r2
  LDI r2, 1
  SUB r5, r2
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r1, 0x2201
  LDI r13, 0x2200
  LOAD r5, r13

dt_loop:
  JZ r5, dt_done

  LOAD r14, r1
  LDI r2, 16
  MUL r14, r2
  MOV r13, r1
  LDI r2, 1
  ADD r13, r2
  LOAD r4, r13
  LDI r2, 16
  MUL r4, r2
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LOAD r13, r13

  ; color: 1=green, 2=red, 3=cyan
  LDI r2, 2
  CMP r13, r2
  BGE r15, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r2, 3
  CMP r13, r2
  JZ r15, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r8, 16
  LDI r2, 16
  RECTF r14, r4, r8, r2, r22

dt_next:
  LDI r2, 4
  ADD r1, r2
  LDI r2, 1
  SUB r5, r2
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r13, 0x2408
  LOAD r14, r13
  LDI r2, 16
  MUL r14, r2
  LDI r13, 0x2409
  LOAD r1, r13
  LDI r2, 16
  MUL r1, r2

  ; color by placing_type
  LDI r13, 0x240A
  LOAD r13, r13
  JZ r13, cur_white
  LDI r2, 2
  CMP r13, r2
  BGE r15, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r2, 3
  CMP r13, r2
  JZ r15, cur_t3
  LDI r22, 0xFF0000
  JMP cur_draw
cur_t3:
  LDI r22, 0x00FFFF
  JMP cur_draw
cur_white:
  LDI r22, 0xFFFFFF

cur_draw:
  ; top edge (y, x, 16, 2)
  LDI r8, 16
  LDI r2, 2
  RECTF r14, r1, r8, r2, r22
  ; bottom edge (y+14)
  MOV r13, r1
  LDI r2, 14
  ADD r13, r2
  RECTF r14, r13, r8, r2, r22
  ; left edge (y+2, x, 2, 12)
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  LDI r8, 2
  LDI r2, 12
  RECTF r14, r13, r8, r2, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r13, r1
  LDI r2, 2
  ADD r13, r2
  MOV r8, r14
  LDI r2, 14
  ADD r8, r2
  LDI r2, 2
  LDI r4, 12
  RECTF r8, r13, r2, r4, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r13, 0x2400
  LOAD r14, r13
  LDI r2, 200
  CMP r14, r2
  BLT r15, gold_ok
  MOV r14, r2
gold_ok:
  LDI r1, 228
  LDI r8, 8
  LDI r2, 8
  LDI r22, 0xFFCC00
  RECTF r14, r1, r8, r2, r22

  ; Lives indicator (small red squares)
  LDI r13, 0x2401
  LOAD r5, r13
  LDI r1, 100
  LDI r8, 4
  LDI r2, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r5, lives_end
  LDI r4, 228
  RECTF r1, r4, r8, r2, r22
  LDI r4, 6
  ADD r1, r4
  LDI r4, 1
  SUB r5, r4
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r13, 0x2402
  LOAD r5, r13
  LDI r1, 4
  LDI r8, 4
  LDI r2, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r5, wave_end
  LDI r4, 248
  RECTF r1, r4, r8, r2, r22
  LDI r4, 6
  ADD r1, r4
  LDI r4, 1
  SUB r5, r4
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r14, 180
  LDI r1, 228
  LDI r8, 8
  LDI r2, 8
  LDI r22, 0x00CC00
  RECTF r14, r1, r8, r2, r22
  LDI r14, 200
  LDI r22, 0xCC0000
  RECTF r14, r1, r8, r2, r22
  LDI r14, 220
  LDI r22, 0x00CCCC
  RECTF r14, r1, r8, r2, r22

  RET
