; DESCRIPTION: Geometry OS program to draw a red object.

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
  LDI r12, 0x2400
  STORE r12, r14
  LDI r14, 20
  LDI r12, 0x2401
  STORE r12, r14
  LDI r14, 0
  LDI r12, 0x2402
  STORE r12, r14
  LDI r12, 0x2403
  STORE r12, r14
  LDI r12, 0x2405
  STORE r12, r14
  LDI r12, 0x2407
  STORE r12, r14
  LDI r12, 0x2408
  STORE r12, r14
  LDI r12, 0x2409
  STORE r12, r14
  LDI r12, 0x240A
  STORE r12, r14
  LDI r12, 0x2100
  STORE r12, r14
  LDI r12, 0x2200
  STORE r12, r14
  LDI r12, 0x2300
  STORE r12, r14

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r14, 10
  LDI r12, 0x2000
  STORE r12, r14

  ; wp0 (8, 40)
  LDI r14, 8
  LDI r12, 0x2001
  STORE r12, r14
  LDI r14, 40
  LDI r12, 0x2002
  STORE r12, r14
  ; wp1 (104, 40)
  LDI r14, 104
  LDI r12, 0x2003
  STORE r12, r14
  LDI r14, 40
  LDI r12, 0x2004
  STORE r12, r14
  ; wp2 (104, 104)
  LDI r14, 104
  LDI r12, 0x2005
  STORE r12, r14
  LDI r14, 104
  LDI r12, 0x2006
  STORE r12, r14
  ; wp3 (40, 104)
  LDI r14, 40
  LDI r12, 0x2007
  STORE r12, r14
  LDI r14, 104
  LDI r12, 0x2008
  STORE r12, r14
  ; wp4 (40, 168)
  LDI r14, 40
  LDI r12, 0x2009
  STORE r12, r14
  LDI r14, 168
  LDI r12, 0x200A
  STORE r12, r14
  ; wp5 (136, 168)
  LDI r14, 136
  LDI r12, 0x200B
  STORE r12, r14
  LDI r14, 168
  LDI r12, 0x200C
  STORE r12, r14
  ; wp6 (136, 72)
  LDI r14, 136
  LDI r12, 0x200D
  STORE r12, r14
  LDI r14, 72
  LDI r12, 0x200E
  STORE r12, r14
  ; wp7 (216, 72)
  LDI r14, 216
  LDI r12, 0x200F
  STORE r12, r14
  LDI r14, 72
  LDI r12, 0x2010
  STORE r12, r14
  ; wp8 (216, 168)
  LDI r14, 216
  LDI r12, 0x2011
  STORE r12, r14
  LDI r14, 168
  LDI r12, 0x2012
  STORE r12, r14
  ; wp9 (248, 168)
  LDI r14, 248
  LDI r12, 0x2013
  STORE r12, r14
  LDI r14, 168
  LDI r12, 0x2014
  STORE r12, r14

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r12, 0x2407
  LOAD r14, r12
  JNZ r14, game_over_screen

  ; clear screen dark green
  LDI r14, 0x1A3A1A
  FILL r14

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r14, 0x1A1A3A
  LDI r4, 0
  LDI r9, 224
  LDI r6, 256
  LDI r7, 32
  RECTF r4, r9, r6, r7, r14

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
  LDI r4, 0
  LDI r9, 32
  LDI r6, 112
  LDI r7, 16
  RECTF r4, r9, r6, r7, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r4, 96
  LDI r9, 32
  LDI r6, 16
  LDI r7, 80
  RECTF r4, r9, r6, r7, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r4, 32
  LDI r9, 96
  LDI r6, 80
  LDI r7, 16
  RECTF r4, r9, r6, r7, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r4, 32
  LDI r9, 96
  LDI r6, 16
  LDI r7, 80
  RECTF r4, r9, r6, r7, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r4, 32
  LDI r9, 160
  LDI r6, 112
  LDI r7, 16
  RECTF r4, r9, r6, r7, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r4, 128
  LDI r9, 64
  LDI r6, 16
  LDI r7, 112
  RECTF r4, r9, r6, r7, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r4, 128
  LDI r9, 64
  LDI r6, 96
  LDI r7, 16
  RECTF r4, r9, r6, r7, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r4, 208
  LDI r9, 64
  LDI r6, 16
  LDI r7, 112
  RECTF r4, r9, r6, r7, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r4, 208
  LDI r9, 160
  LDI r6, 48
  LDI r7, 16
  RECTF r4, r9, r6, r7, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r4, 0
  LDI r9, 32
  LDI r6, 4
  LDI r7, 16
  RECTF r4, r9, r6, r7, r22
  LDI r22, 0xCC0000
  LDI r4, 252
  LDI r9, 160
  RECTF r4, r9, r6, r7, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r0
  JZ r0, input_done

  LDI r7, 87
  CMP r0, r7
  JZ r11, input_up
  LDI r7, 119
  CMP r0, r7
  JZ r11, input_up
  LDI r7, 83
  CMP r0, r7
  JZ r11, input_down
  LDI r7, 115
  CMP r0, r7
  JZ r11, input_down
  LDI r7, 65
  CMP r0, r7
  JZ r11, input_left
  LDI r7, 97
  CMP r0, r7
  JZ r11, input_left
  LDI r7, 68
  CMP r0, r7
  JZ r11, input_right
  LDI r7, 100
  CMP r0, r7
  JZ r11, input_right
  LDI r7, 49
  CMP r0, r7
  JZ r11, input_sel1
  LDI r7, 50
  CMP r0, r7
  JZ r11, input_sel2
  LDI r7, 51
  CMP r0, r7
  JZ r11, input_sel3
  LDI r7, 32
  CMP r0, r7
  JZ r11, input_place
  LDI r7, 78
  CMP r0, r7
  JZ r11, input_newwave
  LDI r7, 110
  CMP r0, r7
  JZ r11, input_newwave
  LDI r7, 82
  CMP r0, r7
  JZ r11, do_restart
  LDI r7, 114
  CMP r0, r7
  JZ r11, do_restart
  JMP input_done

input_up:
  LDI r12, 0x2409
  LOAD r14, r12
  JZ r14, input_done
  LDI r7, 1
  SUB r14, r7
  STORE r12, r14
  JMP input_done

input_down:
  LDI r12, 0x2409
  LOAD r14, r12
  LDI r7, 13
  CMP r14, r7
  BGE r11, input_done
  LDI r7, 1
  ADD r14, r7
  STORE r12, r14
  JMP input_done

input_left:
  LDI r12, 0x2408
  LOAD r14, r12
  JZ r14, input_done
  LDI r7, 1
  SUB r14, r7
  STORE r12, r14
  JMP input_done

input_right:
  LDI r12, 0x2408
  LOAD r14, r12
  LDI r7, 15
  CMP r14, r7
  BGE r11, input_done
  LDI r7, 1
  ADD r14, r7
  STORE r12, r14
  JMP input_done

input_sel1:
  LDI r14, 1
  LDI r12, 0x240A
  STORE r12, r14
  JMP input_done

input_sel2:
  LDI r14, 2
  LDI r12, 0x240A
  STORE r12, r14
  JMP input_done

input_sel3:
  LDI r14, 3
  LDI r12, 0x240A
  STORE r12, r14
  JMP input_done

input_newwave:
  LDI r12, 0x2403
  LOAD r14, r12
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
  LDI r12, 0x240A
  LOAD r14, r12
  JZ r14, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r7, 2
  CMP r14, r7
  BGE r11, place_type2or3
  LDI r7, 10
  JMP place_check_gold
place_type2or3:
  LDI r7, 3
  CMP r14, r7
  JZ r11, place_type3
  LDI r7, 25
  JMP place_check_gold
place_type3:
  LDI r7, 15

place_check_gold:
  ; r7=cost, r14=type
  LDI r12, 0x2400
  LOAD r4, r12
  CMP r4, r7
  BLT r11, input_done

  LDI r12, 0x2200
  LOAD r9, r12
  LDI r0, 8
  CMP r9, r0
  BGE r11, input_done

  LDI r12, 0x2409
  LOAD r0, r12
  LDI r6, 14
  CMP r0, r6
  BGE r11, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r14, input_done

  ; deduct gold
  SUB r4, r7
  LDI r12, 0x2400
  STORE r12, r4

  ; slot addr = 0x2201 + count * 4
  LDI r12, 0x2200
  LOAD r9, r12
  LDI r0, 4
  MUL r9, r0
  LDI r6, 0x2201
  ADD r6, r9

  ; cell_x
  LDI r12, 0x2408
  LOAD r9, r12
  STORE r6, r9
  LDI r0, 1
  ADD r6, r0
  ; cell_y
  LDI r12, 0x2409
  LOAD r9, r12
  STORE r6, r9
  LDI r0, 1
  ADD r6, r0
  ; type
  STORE r6, r14
  LDI r0, 1
  ADD r6, r0
  ; cd_timer = 0
  LDI r9, 0
  STORE r6, r9

  ; increment tower count
  LDI r12, 0x2200
  LOAD r9, r12
  LDI r0, 1
  ADD r9, r0
  STORE r12, r9

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r14=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r12, 0x2408
  LOAD r3, r12
  LDI r12, 0x2409
  LOAD r15, r12
  LDI r12, 0x2200
  LOAD r2, r12
  LDI r9, 0x2201
  LDI r14, 0

ctc_loop:
  JZ r2, ctc_done
  LOAD r6, r9
  MOV r12, r9
  LDI r7, 1
  ADD r12, r7
  LOAD r7, r12
  CMP r6, r3
  JNZ r11, ctc_next
  CMP r7, r15
  JNZ r11, ctc_next
  LDI r14, 1
  JMP ctc_done
ctc_next:
  LDI r7, 4
  ADD r9, r7
  LDI r7, 1
  SUB r2, r7
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r12, 0x2402
  LOAD r14, r12
  LDI r7, 1
  ADD r14, r7
  STORE r12, r14
  ; enemies_per_wave = 3 + wave*2
  MOV r6, r14
  LDI r7, 2
  MUL r6, r7
  LDI r7, 3
  ADD r6, r7
  LDI r12, 0x2406
  STORE r12, r6
  LDI r14, 1
  LDI r12, 0x2403
  STORE r12, r14
  LDI r14, 0
  LDI r12, 0x2404
  STORE r12, r14
  LDI r12, 0x2405
  STORE r12, r14
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r12, 0x2403
  LOAD r14, r12
  JZ r14, spawn_done

  LDI r12, 0x2405
  LOAD r4, r12
  LDI r12, 0x2406
  LOAD r9, r12
  CMP r4, r9
  BGE r11, spawn_check_done

  LDI r12, 0x2404
  LOAD r14, r12
  JZ r14, do_spawn
  LDI r7, 1
  SUB r14, r7
  STORE r12, r14
  JMP spawn_done

do_spawn:
  LDI r9, 0x2101
  LDI r2, 16

find_slot:
  JZ r2, spawn_done
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LOAD r12, r12
  JNZ r12, find_next

  ; spawn at wp0 center (8, 40)
  LDI r6, 8
  STORE r9, r6
  MOV r12, r9
  LDI r7, 1
  ADD r12, r7
  LDI r6, 40
  STORE r12, r6
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  ; hp = 2 + wave
  LDI r6, 0x2402
  LOAD r6, r6
  LDI r7, 2
  ADD r6, r7
  STORE r12, r6
  MOV r12, r9
  LDI r7, 3
  ADD r12, r7
  LDI r6, 1
  STORE r12, r6

  ; increment spawned
  LDI r12, 0x2405
  LOAD r6, r12
  LDI r7, 1
  ADD r6, r7
  STORE r12, r6
  ; spawn_timer = 30
  LDI r6, 30
  LDI r12, 0x2404
  STORE r12, r6
  ; increment enemy_count
  LDI r12, 0x2100
  LOAD r6, r12
  LDI r7, 1
  ADD r6, r7
  STORE r12, r6

  JMP spawn_done

find_next:
  LDI r7, 4
  ADD r9, r7
  LDI r7, 1
  SUB r2, r7
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r9, 0x2101
  LDI r2, 16
  LDI r14, 0
chk_alive:
  JZ r2, chk_done
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LOAD r12, r12
  JZ r12, chk_next
  LDI r7, 1
  ADD r14, r7
chk_next:
  LDI r7, 4
  ADD r9, r7
  LDI r7, 1
  SUB r2, r7
  JMP chk_alive
chk_done:
  JNZ r14, spawn_done
  LDI r14, 0
  LDI r12, 0x2403
  STORE r12, r14

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r9, 0x2101
  LDI r2, 16

me_loop:
  JZ r2, me_done

  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LOAD r12, r12
  JZ r12, me_next

  MOV r12, r9
  LDI r7, 3
  ADD r12, r7
  LOAD r5, r12

  LDI r7, 10
  CMP r5, r7
  BGE r11, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r6, r5
  LDI r7, 2
  MUL r6, r7
  LDI r12, 0x2001
  ADD r12, r6
  LOAD r13, r12
  LDI r7, 1
  ADD r12, r7
  LOAD r1, r12

  LOAD r3, r9
  MOV r12, r9
  LDI r7, 1
  ADD r12, r7
  LOAD r15, r12

  ; dx
  MOV r6, r13
  SUB r6, r3
  JNZ r6, me_move_h

  ; dy
  MOV r6, r1
  SUB r6, r15
  JZ r6, me_reached

  MOV r12, r6
  LDI r7, 31
  SAR r12, r7
  JZ r12, me_down
  LDI r7, 1
  SUB r15, r7
  JMP me_store
me_down:
  LDI r7, 1
  ADD r15, r7
  JMP me_store

me_move_h:
  MOV r12, r6
  LDI r7, 31
  SAR r12, r7
  JZ r12, me_right
  LDI r7, 1
  SUB r3, r7
  JMP me_store
me_right:
  LDI r7, 1
  ADD r3, r7
  JMP me_store

me_reached:
  MOV r12, r9
  LDI r7, 3
  ADD r12, r7
  LOAD r5, r12
  LDI r7, 1
  ADD r5, r7
  STORE r12, r5
  JMP me_next

enemy_escaped:
  LDI r12, 0x2401
  LOAD r6, r12
  LDI r7, 1
  SUB r6, r7
  STORE r12, r6
  JZ r6, set_game_over
  ; kill enemy
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LDI r6, 0
  STORE r12, r6
  LDI r12, 0x2100
  LOAD r6, r12
  LDI r7, 1
  SUB r6, r7
  STORE r12, r6
  JMP me_next

set_game_over:
  LDI r6, 1
  LDI r12, 0x2407
  STORE r12, r6
  JMP me_next

me_store:
  STORE r9, r3
  MOV r12, r9
  LDI r7, 1
  ADD r12, r7
  STORE r12, r15

me_next:
  LDI r7, 4
  ADD r9, r7
  LDI r7, 1
  SUB r2, r7
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r9, 0x2201
  LDI r12, 0x2200
  LOAD r2, r12

ut_loop:
  JZ r2, ut_done

  ; decrement cd
  MOV r12, r9
  LDI r7, 3
  ADD r12, r7
  LOAD r12, r12
  JZ r12, ut_ready
  LDI r7, 1
  SUB r12, r7
  MOV r6, r9
  LDI r7, 3
  ADD r6, r7
  STORE r6, r12
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r6, r9
  LDI r7, 16
  MUL r6, r7
  LDI r7, 8
  ADD r6, r7
  MOV r12, r9
  LDI r7, 1
  ADD r12, r7
  LOAD r7, r12
  LDI r0, 16
  MUL r7, r0
  LDI r0, 8
  ADD r7, r0

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r12, r9
  LDI r0, 2
  ADD r12, r0
  LOAD r12, r12
  LDI r0, 2
  CMP r12, r0
  BGE r11, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r0, 3
  CMP r12, r0
  JZ r11, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r8, 0xFFFFFFFF
  LDI r3, 0
  LDI r13, 0x2101
  LDI r1, 16

ut_sl:
  JZ r1, ut_sd
  MOV r12, r13
  LDI r0, 2
  ADD r12, r0
  LOAD r12, r12
  JZ r12, ut_sn

  LOAD r14, r13
  MOV r12, r13
  LDI r0, 1
  ADD r12, r0
  LOAD r4, r12

  MOV r12, r14
  SUB r12, r6
  MOV r0, r12
  MUL r0, r0
  MOV r15, r4
  SUB r15, r7
  MOV r12, r15
  MUL r12, r12
  ADD r0, r12

  CMP r0, r20
  BGE r11, ut_sn
  CMP r0, r8
  BGE r11, ut_sn
  MOV r8, r0
  MOV r10, r13
  LDI r3, 1

ut_sn:
  LDI r0, 4
  ADD r13, r0
  LDI r0, 1
  SUB r1, r0
  JMP ut_sl

ut_sd:
  JZ r3, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r12, r9
  LDI r0, 2
  ADD r12, r0
  LOAD r12, r12
  LDI r0, 2
  CMP r12, r0
  BGE r11, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r0, 3
  CMP r12, r0
  JZ r11, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r12, r10
  LDI r0, 2
  ADD r12, r0
  LOAD r0, r12
  CMP r0, r21
  BLT r11, ut_kill
  SUB r0, r21
  STORE r12, r0
  JMP ut_cd

ut_kill:
  LDI r0, 0
  STORE r12, r0
  LDI r12, 0x2400
  LOAD r0, r12
  LDI r6, 5
  ADD r0, r6
  STORE r12, r0
  LDI r12, 0x2100
  LOAD r0, r12
  LDI r6, 1
  SUB r0, r6
  STORE r12, r0
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r12, r9
  LDI r0, 2
  ADD r12, r0
  LOAD r12, r12
  LDI r0, 2
  CMP r12, r0
  BGE r11, ut_c2or3
  LDI r0, 20
  JMP ut_scd
ut_c2or3:
  LDI r0, 3
  CMP r12, r0
  JZ r11, ut_c3
  LDI r0, 45
  JMP ut_scd
ut_c3:
  LDI r0, 30

ut_scd:
  MOV r12, r9
  LDI r6, 3
  ADD r12, r6
  STORE r12, r0

ut_next:
  LDI r7, 4
  ADD r9, r7
  LDI r7, 1
  SUB r2, r7
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r10=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r9, 0x2301
  LDI r2, 8
cs_loop:
  JZ r2, cs_done
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LOAD r12, r12
  JNZ r12, cs_next

  LOAD r12, r10
  STORE r9, r12
  MOV r6, r9
  LDI r7, 1
  ADD r6, r7
  MOV r12, r10
  LDI r7, 1
  ADD r12, r7
  LOAD r12, r12
  STORE r6, r12
  MOV r6, r9
  LDI r7, 2
  ADD r6, r7
  LDI r12, 5
  STORE r6, r12
  JMP cs_done

cs_next:
  LDI r7, 3
  ADD r9, r7
  LDI r7, 1
  SUB r2, r7
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r9=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r9, 0x2301
  LDI r2, 8

ds_loop:
  JZ r2, ds_done

  ; check timer (offset 2 from r9)
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LOAD r12, r12
  JZ r12, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r4, r9           ; r4 = ex
  LDI r7, 3
  SUB r4, r7            ; x = ex - 3
  MOV r12, r9
  LDI r7, 1
  ADD r12, r7
  LOAD r12, r12           ; r12 = ey (NOT r9)
  LDI r7, 3
  SUB r12, r7            ; y = ey - 3
  LDI r6, 6
  LDI r7, 6
  LDI r22, 0xFFFF00
  RECTF r4, r12, r6, r7, r22

  ; decrement timer
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LOAD r6, r12
  LDI r7, 1
  SUB r6, r7
  STORE r12, r6

  JMP ds_next

ds_skip:
ds_next:
  LDI r7, 3
  ADD r9, r7
  LDI r7, 1
  SUB r2, r7
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r9, 0x2101
  LDI r2, 16

de_loop:
  JZ r2, de_done

  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LOAD r12, r12
  JZ r12, de_next

  LOAD r4, r9
  LDI r7, 3
  SUB r4, r7
  MOV r12, r9
  LDI r7, 1
  ADD r12, r7
  LOAD r12, r12
  LDI r7, 3
  SUB r12, r7
  LDI r6, 6
  LDI r7, 6
  LDI r22, 0xFF4444
  RECTF r4, r12, r6, r7, r22

de_next:
  LDI r7, 4
  ADD r9, r7
  LDI r7, 1
  SUB r2, r7
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r9, 0x2201
  LDI r12, 0x2200
  LOAD r2, r12

dt_loop:
  JZ r2, dt_done

  LOAD r4, r9
  LDI r7, 16
  MUL r4, r7
  MOV r12, r9
  LDI r7, 1
  ADD r12, r7
  LOAD r0, r12
  LDI r7, 16
  MUL r0, r7
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LOAD r12, r12

  ; color: 1=green, 2=red, 3=cyan
  LDI r7, 2
  CMP r12, r7
  BGE r11, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r7, 3
  CMP r12, r7
  JZ r11, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r6, 16
  LDI r7, 16
  RECTF r4, r0, r6, r7, r22

dt_next:
  LDI r7, 4
  ADD r9, r7
  LDI r7, 1
  SUB r2, r7
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r12, 0x2408
  LOAD r4, r12
  LDI r7, 16
  MUL r4, r7
  LDI r12, 0x2409
  LOAD r9, r12
  LDI r7, 16
  MUL r9, r7

  ; color by placing_type
  LDI r12, 0x240A
  LOAD r12, r12
  JZ r12, cur_white
  LDI r7, 2
  CMP r12, r7
  BGE r11, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r7, 3
  CMP r12, r7
  JZ r11, cur_t3
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
  LDI r7, 2
  RECTF r4, r9, r6, r7, r22
  ; bottom edge (y+14)
  MOV r12, r9
  LDI r7, 14
  ADD r12, r7
  RECTF r4, r12, r6, r7, r22
  ; left edge (y+2, x, 2, 12)
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  LDI r6, 2
  LDI r7, 12
  RECTF r4, r12, r6, r7, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r12, r9
  LDI r7, 2
  ADD r12, r7
  MOV r6, r4
  LDI r7, 14
  ADD r6, r7
  LDI r7, 2
  LDI r0, 12
  RECTF r6, r12, r7, r0, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r12, 0x2400
  LOAD r4, r12
  LDI r7, 200
  CMP r4, r7
  BLT r11, gold_ok
  MOV r4, r7
gold_ok:
  LDI r9, 228
  LDI r6, 8
  LDI r7, 8
  LDI r22, 0xFFCC00
  RECTF r4, r9, r6, r7, r22

  ; Lives indicator (small red squares)
  LDI r12, 0x2401
  LOAD r2, r12
  LDI r9, 100
  LDI r6, 4
  LDI r7, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r2, lives_end
  LDI r0, 228
  RECTF r9, r0, r6, r7, r22
  LDI r0, 6
  ADD r9, r0
  LDI r0, 1
  SUB r2, r0
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r12, 0x2402
  LOAD r2, r12
  LDI r9, 4
  LDI r6, 4
  LDI r7, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r2, wave_end
  LDI r0, 248
  RECTF r9, r0, r6, r7, r22
  LDI r0, 6
  ADD r9, r0
  LDI r0, 1
  SUB r2, r0
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r4, 180
  LDI r9, 228
  LDI r6, 8
  LDI r7, 8
  LDI r22, 0x00CC00
  RECTF r4, r9, r6, r7, r22
  LDI r4, 200
  LDI r22, 0xCC0000
  RECTF r4, r9, r6, r7, r22
  LDI r4, 220
  LDI r22, 0x00CCCC
  RECTF r4, r9, r6, r7, r22

  RET
