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

  LDI r1, 50
  LDI r4, 0x2400
  STORE r4, r1
  LDI r1, 20
  LDI r4, 0x2401
  STORE r4, r1
  LDI r1, 0
  LDI r4, 0x2402
  STORE r4, r1
  LDI r4, 0x2403
  STORE r4, r1
  LDI r4, 0x2405
  STORE r4, r1
  LDI r4, 0x2407
  STORE r4, r1
  LDI r4, 0x2408
  STORE r4, r1
  LDI r4, 0x2409
  STORE r4, r1
  LDI r4, 0x240A
  STORE r4, r1
  LDI r4, 0x2100
  STORE r4, r1
  LDI r4, 0x2200
  STORE r4, r1
  LDI r4, 0x2300
  STORE r4, r1

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r1, 10
  LDI r4, 0x2000
  STORE r4, r1

  ; wp0 (8, 40)
  LDI r1, 8
  LDI r4, 0x2001
  STORE r4, r1
  LDI r1, 40
  LDI r4, 0x2002
  STORE r4, r1
  ; wp1 (104, 40)
  LDI r1, 104
  LDI r4, 0x2003
  STORE r4, r1
  LDI r1, 40
  LDI r4, 0x2004
  STORE r4, r1
  ; wp2 (104, 104)
  LDI r1, 104
  LDI r4, 0x2005
  STORE r4, r1
  LDI r1, 104
  LDI r4, 0x2006
  STORE r4, r1
  ; wp3 (40, 104)
  LDI r1, 40
  LDI r4, 0x2007
  STORE r4, r1
  LDI r1, 104
  LDI r4, 0x2008
  STORE r4, r1
  ; wp4 (40, 168)
  LDI r1, 40
  LDI r4, 0x2009
  STORE r4, r1
  LDI r1, 168
  LDI r4, 0x200A
  STORE r4, r1
  ; wp5 (136, 168)
  LDI r1, 136
  LDI r4, 0x200B
  STORE r4, r1
  LDI r1, 168
  LDI r4, 0x200C
  STORE r4, r1
  ; wp6 (136, 72)
  LDI r1, 136
  LDI r4, 0x200D
  STORE r4, r1
  LDI r1, 72
  LDI r4, 0x200E
  STORE r4, r1
  ; wp7 (216, 72)
  LDI r1, 216
  LDI r4, 0x200F
  STORE r4, r1
  LDI r1, 72
  LDI r4, 0x2010
  STORE r4, r1
  ; wp8 (216, 168)
  LDI r1, 216
  LDI r4, 0x2011
  STORE r4, r1
  LDI r1, 168
  LDI r4, 0x2012
  STORE r4, r1
  ; wp9 (248, 168)
  LDI r1, 248
  LDI r4, 0x2013
  STORE r4, r1
  LDI r1, 168
  LDI r4, 0x2014
  STORE r4, r1

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r4, 0x2407
  LOAD r1, r4
  JNZ r1, game_over_screen

  ; clear screen dark green
  LDI r1, 0x1A3A1A
  FILL r1

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r1, 0x1A1A3A
  LDI r2, 0
  LDI r3, 224
  LDI r5, 256
  LDI r6, 32
  RECTF r2, r3, r5, r6, r1

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
  LDI r1, 0x550000
  FILL r1
  FRAME
  IKEY r1
  JZ r1, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r2, 0
  LDI r3, 32
  LDI r5, 112
  LDI r6, 16
  RECTF r2, r3, r5, r6, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r2, 96
  LDI r3, 32
  LDI r5, 16
  LDI r6, 80
  RECTF r2, r3, r5, r6, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r2, 32
  LDI r3, 96
  LDI r5, 80
  LDI r6, 16
  RECTF r2, r3, r5, r6, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r2, 32
  LDI r3, 96
  LDI r5, 16
  LDI r6, 80
  RECTF r2, r3, r5, r6, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r2, 32
  LDI r3, 160
  LDI r5, 112
  LDI r6, 16
  RECTF r2, r3, r5, r6, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r2, 128
  LDI r3, 64
  LDI r5, 16
  LDI r6, 112
  RECTF r2, r3, r5, r6, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r2, 128
  LDI r3, 64
  LDI r5, 96
  LDI r6, 16
  RECTF r2, r3, r5, r6, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r2, 208
  LDI r3, 64
  LDI r5, 16
  LDI r6, 112
  RECTF r2, r3, r5, r6, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r2, 208
  LDI r3, 160
  LDI r5, 48
  LDI r6, 16
  RECTF r2, r3, r5, r6, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r2, 0
  LDI r3, 32
  LDI r5, 4
  LDI r6, 16
  RECTF r2, r3, r5, r6, r22
  LDI r22, 0xCC0000
  LDI r2, 252
  LDI r3, 160
  RECTF r2, r3, r5, r6, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r7
  JZ r7, input_done

  LDI r6, 87
  CMP r7, r6
  JZ r0, input_up
  LDI r6, 119
  CMP r7, r6
  JZ r0, input_up
  LDI r6, 83
  CMP r7, r6
  JZ r0, input_down
  LDI r6, 115
  CMP r7, r6
  JZ r0, input_down
  LDI r6, 65
  CMP r7, r6
  JZ r0, input_left
  LDI r6, 97
  CMP r7, r6
  JZ r0, input_left
  LDI r6, 68
  CMP r7, r6
  JZ r0, input_right
  LDI r6, 100
  CMP r7, r6
  JZ r0, input_right
  LDI r6, 49
  CMP r7, r6
  JZ r0, input_sel1
  LDI r6, 50
  CMP r7, r6
  JZ r0, input_sel2
  LDI r6, 51
  CMP r7, r6
  JZ r0, input_sel3
  LDI r6, 32
  CMP r7, r6
  JZ r0, input_place
  LDI r6, 78
  CMP r7, r6
  JZ r0, input_newwave
  LDI r6, 110
  CMP r7, r6
  JZ r0, input_newwave
  LDI r6, 82
  CMP r7, r6
  JZ r0, do_restart
  LDI r6, 114
  CMP r7, r6
  JZ r0, do_restart
  JMP input_done

input_up:
  LDI r4, 0x2409
  LOAD r1, r4
  JZ r1, input_done
  LDI r6, 1
  SUB r1, r6
  STORE r4, r1
  JMP input_done

input_down:
  LDI r4, 0x2409
  LOAD r1, r4
  LDI r6, 13
  CMP r1, r6
  BGE r0, input_done
  LDI r6, 1
  ADD r1, r6
  STORE r4, r1
  JMP input_done

input_left:
  LDI r4, 0x2408
  LOAD r1, r4
  JZ r1, input_done
  LDI r6, 1
  SUB r1, r6
  STORE r4, r1
  JMP input_done

input_right:
  LDI r4, 0x2408
  LOAD r1, r4
  LDI r6, 15
  CMP r1, r6
  BGE r0, input_done
  LDI r6, 1
  ADD r1, r6
  STORE r4, r1
  JMP input_done

input_sel1:
  LDI r1, 1
  LDI r4, 0x240A
  STORE r4, r1
  JMP input_done

input_sel2:
  LDI r1, 2
  LDI r4, 0x240A
  STORE r4, r1
  JMP input_done

input_sel3:
  LDI r1, 3
  LDI r4, 0x240A
  STORE r4, r1
  JMP input_done

input_newwave:
  LDI r4, 0x2403
  LOAD r1, r4
  JNZ r1, input_done
  PUSH r31
  CALL start_wave
  POP r31
  JMP input_done

do_restart:
  ; POP the value game_loop pushed, then restart
  POP r31
  JMP restart

input_place:
  LDI r4, 0x240A
  LOAD r1, r4
  JZ r1, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r6, 2
  CMP r1, r6
  BGE r0, place_type2or3
  LDI r6, 10
  JMP place_check_gold
place_type2or3:
  LDI r6, 3
  CMP r1, r6
  JZ r0, place_type3
  LDI r6, 25
  JMP place_check_gold
place_type3:
  LDI r6, 15

place_check_gold:
  ; r6=cost, r1=type
  LDI r4, 0x2400
  LOAD r2, r4
  CMP r2, r6
  BLT r0, input_done

  LDI r4, 0x2200
  LOAD r3, r4
  LDI r7, 8
  CMP r3, r7
  BGE r0, input_done

  LDI r4, 0x2409
  LOAD r7, r4
  LDI r5, 14
  CMP r7, r5
  BGE r0, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r1, input_done

  ; deduct gold
  SUB r2, r6
  LDI r4, 0x2400
  STORE r4, r2

  ; slot addr = 0x2201 + count * 4
  LDI r4, 0x2200
  LOAD r3, r4
  LDI r7, 4
  MUL r3, r7
  LDI r5, 0x2201
  ADD r5, r3

  ; cell_x
  LDI r4, 0x2408
  LOAD r3, r4
  STORE r5, r3
  LDI r7, 1
  ADD r5, r7
  ; cell_y
  LDI r4, 0x2409
  LOAD r3, r4
  STORE r5, r3
  LDI r7, 1
  ADD r5, r7
  ; type
  STORE r5, r1
  LDI r7, 1
  ADD r5, r7
  ; cd_timer = 0
  LDI r3, 0
  STORE r5, r3

  ; increment tower count
  LDI r4, 0x2200
  LOAD r3, r4
  LDI r7, 1
  ADD r3, r7
  STORE r4, r3

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r1=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r4, 0x2408
  LOAD r10, r4
  LDI r4, 0x2409
  LOAD r11, r4
  LDI r4, 0x2200
  LOAD r12, r4
  LDI r3, 0x2201
  LDI r1, 0

ctc_loop:
  JZ r12, ctc_done
  LOAD r5, r3
  MOV r4, r3
  LDI r6, 1
  ADD r4, r6
  LOAD r6, r4
  CMP r5, r10
  JNZ r0, ctc_next
  CMP r6, r11
  JNZ r0, ctc_next
  LDI r1, 1
  JMP ctc_done
ctc_next:
  LDI r6, 4
  ADD r3, r6
  LDI r6, 1
  SUB r12, r6
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r4, 0x2402
  LOAD r1, r4
  LDI r6, 1
  ADD r1, r6
  STORE r4, r1
  ; enemies_per_wave = 3 + wave*2
  MOV r5, r1
  LDI r6, 2
  MUL r5, r6
  LDI r6, 3
  ADD r5, r6
  LDI r4, 0x2406
  STORE r4, r5
  LDI r1, 1
  LDI r4, 0x2403
  STORE r4, r1
  LDI r1, 0
  LDI r4, 0x2404
  STORE r4, r1
  LDI r4, 0x2405
  STORE r4, r1
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r4, 0x2403
  LOAD r1, r4
  JZ r1, spawn_done

  LDI r4, 0x2405
  LOAD r2, r4
  LDI r4, 0x2406
  LOAD r3, r4
  CMP r2, r3
  BGE r0, spawn_check_done

  LDI r4, 0x2404
  LOAD r1, r4
  JZ r1, do_spawn
  LDI r6, 1
  SUB r1, r6
  STORE r4, r1
  JMP spawn_done

do_spawn:
  LDI r3, 0x2101
  LDI r12, 16

find_slot:
  JZ r12, spawn_done
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LOAD r4, r4
  JNZ r4, find_next

  ; spawn at wp0 center (8, 40)
  LDI r5, 8
  STORE r3, r5
  MOV r4, r3
  LDI r6, 1
  ADD r4, r6
  LDI r5, 40
  STORE r4, r5
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  ; hp = 2 + wave
  LDI r5, 0x2402
  LOAD r5, r5
  LDI r6, 2
  ADD r5, r6
  STORE r4, r5
  MOV r4, r3
  LDI r6, 3
  ADD r4, r6
  LDI r5, 1
  STORE r4, r5

  ; increment spawned
  LDI r4, 0x2405
  LOAD r5, r4
  LDI r6, 1
  ADD r5, r6
  STORE r4, r5
  ; spawn_timer = 30
  LDI r5, 30
  LDI r4, 0x2404
  STORE r4, r5
  ; increment enemy_count
  LDI r4, 0x2100
  LOAD r5, r4
  LDI r6, 1
  ADD r5, r6
  STORE r4, r5

  JMP spawn_done

find_next:
  LDI r6, 4
  ADD r3, r6
  LDI r6, 1
  SUB r12, r6
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r3, 0x2101
  LDI r12, 16
  LDI r1, 0
chk_alive:
  JZ r12, chk_done
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LOAD r4, r4
  JZ r4, chk_next
  LDI r6, 1
  ADD r1, r6
chk_next:
  LDI r6, 4
  ADD r3, r6
  LDI r6, 1
  SUB r12, r6
  JMP chk_alive
chk_done:
  JNZ r1, spawn_done
  LDI r1, 0
  LDI r4, 0x2403
  STORE r4, r1

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r3, 0x2101
  LDI r12, 16

me_loop:
  JZ r12, me_done

  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LOAD r4, r4
  JZ r4, me_next

  MOV r4, r3
  LDI r6, 3
  ADD r4, r6
  LOAD r13, r4

  LDI r6, 10
  CMP r13, r6
  BGE r0, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r5, r13
  LDI r6, 2
  MUL r5, r6
  LDI r4, 0x2001
  ADD r4, r5
  LOAD r14, r4
  LDI r6, 1
  ADD r4, r6
  LOAD r15, r4

  LOAD r10, r3
  MOV r4, r3
  LDI r6, 1
  ADD r4, r6
  LOAD r11, r4

  ; dx
  MOV r5, r14
  SUB r5, r10
  JNZ r5, me_move_h

  ; dy
  MOV r5, r15
  SUB r5, r11
  JZ r5, me_reached

  MOV r4, r5
  LDI r6, 31
  SAR r4, r6
  JZ r4, me_down
  LDI r6, 1
  SUB r11, r6
  JMP me_store
me_down:
  LDI r6, 1
  ADD r11, r6
  JMP me_store

me_move_h:
  MOV r4, r5
  LDI r6, 31
  SAR r4, r6
  JZ r4, me_right
  LDI r6, 1
  SUB r10, r6
  JMP me_store
me_right:
  LDI r6, 1
  ADD r10, r6
  JMP me_store

me_reached:
  MOV r4, r3
  LDI r6, 3
  ADD r4, r6
  LOAD r13, r4
  LDI r6, 1
  ADD r13, r6
  STORE r4, r13
  JMP me_next

enemy_escaped:
  LDI r4, 0x2401
  LOAD r5, r4
  LDI r6, 1
  SUB r5, r6
  STORE r4, r5
  JZ r5, set_game_over
  ; kill enemy
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LDI r5, 0
  STORE r4, r5
  LDI r4, 0x2100
  LOAD r5, r4
  LDI r6, 1
  SUB r5, r6
  STORE r4, r5
  JMP me_next

set_game_over:
  LDI r5, 1
  LDI r4, 0x2407
  STORE r4, r5
  JMP me_next

me_store:
  STORE r3, r10
  MOV r4, r3
  LDI r6, 1
  ADD r4, r6
  STORE r4, r11

me_next:
  LDI r6, 4
  ADD r3, r6
  LDI r6, 1
  SUB r12, r6
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r3, 0x2201
  LDI r4, 0x2200
  LOAD r12, r4

ut_loop:
  JZ r12, ut_done

  ; decrement cd
  MOV r4, r3
  LDI r6, 3
  ADD r4, r6
  LOAD r4, r4
  JZ r4, ut_ready
  LDI r6, 1
  SUB r4, r6
  MOV r5, r3
  LDI r6, 3
  ADD r5, r6
  STORE r5, r4
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r5, r3
  LDI r6, 16
  MUL r5, r6
  LDI r6, 8
  ADD r5, r6
  MOV r4, r3
  LDI r6, 1
  ADD r4, r6
  LOAD r6, r4
  LDI r7, 16
  MUL r6, r7
  LDI r7, 8
  ADD r6, r7

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r4, r3
  LDI r7, 2
  ADD r4, r7
  LOAD r4, r4
  LDI r7, 2
  CMP r4, r7
  BGE r0, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r7, 3
  CMP r4, r7
  JZ r0, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r9, 0xFFFFFFFF
  LDI r10, 0
  LDI r14, 0x2101
  LDI r15, 16

ut_sl:
  JZ r15, ut_sd
  MOV r4, r14
  LDI r7, 2
  ADD r4, r7
  LOAD r4, r4
  JZ r4, ut_sn

  LOAD r1, r14
  MOV r4, r14
  LDI r7, 1
  ADD r4, r7
  LOAD r2, r4

  MOV r4, r1
  SUB r4, r5
  MOV r7, r4
  MUL r7, r7
  MOV r11, r2
  SUB r11, r6
  MOV r4, r11
  MUL r4, r4
  ADD r7, r4

  CMP r7, r20
  BGE r0, ut_sn
  CMP r7, r9
  BGE r0, ut_sn
  MOV r9, r7
  MOV r8, r14
  LDI r10, 1

ut_sn:
  LDI r7, 4
  ADD r14, r7
  LDI r7, 1
  SUB r15, r7
  JMP ut_sl

ut_sd:
  JZ r10, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r4, r3
  LDI r7, 2
  ADD r4, r7
  LOAD r4, r4
  LDI r7, 2
  CMP r4, r7
  BGE r0, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r7, 3
  CMP r4, r7
  JZ r0, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r4, r8
  LDI r7, 2
  ADD r4, r7
  LOAD r7, r4
  CMP r7, r21
  BLT r0, ut_kill
  SUB r7, r21
  STORE r4, r7
  JMP ut_cd

ut_kill:
  LDI r7, 0
  STORE r4, r7
  LDI r4, 0x2400
  LOAD r7, r4
  LDI r5, 5
  ADD r7, r5
  STORE r4, r7
  LDI r4, 0x2100
  LOAD r7, r4
  LDI r5, 1
  SUB r7, r5
  STORE r4, r7
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r4, r3
  LDI r7, 2
  ADD r4, r7
  LOAD r4, r4
  LDI r7, 2
  CMP r4, r7
  BGE r0, ut_c2or3
  LDI r7, 20
  JMP ut_scd
ut_c2or3:
  LDI r7, 3
  CMP r4, r7
  JZ r0, ut_c3
  LDI r7, 45
  JMP ut_scd
ut_c3:
  LDI r7, 30

ut_scd:
  MOV r4, r3
  LDI r5, 3
  ADD r4, r5
  STORE r4, r7

ut_next:
  LDI r6, 4
  ADD r3, r6
  LDI r6, 1
  SUB r12, r6
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r8=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r3, 0x2301
  LDI r12, 8
cs_loop:
  JZ r12, cs_done
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LOAD r4, r4
  JNZ r4, cs_next

  LOAD r4, r8
  STORE r3, r4
  MOV r5, r3
  LDI r6, 1
  ADD r5, r6
  MOV r4, r8
  LDI r6, 1
  ADD r4, r6
  LOAD r4, r4
  STORE r5, r4
  MOV r5, r3
  LDI r6, 2
  ADD r5, r6
  LDI r4, 5
  STORE r5, r4
  JMP cs_done

cs_next:
  LDI r6, 3
  ADD r3, r6
  LDI r6, 1
  SUB r12, r6
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r3=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r3, 0x2301
  LDI r12, 8

ds_loop:
  JZ r12, ds_done

  ; check timer (offset 2 from r3)
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LOAD r4, r4
  JZ r4, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r2, r3           ; r2 = ex
  LDI r6, 3
  SUB r2, r6            ; x = ex - 3
  MOV r4, r3
  LDI r6, 1
  ADD r4, r6
  LOAD r4, r4           ; r4 = ey (NOT r3)
  LDI r6, 3
  SUB r4, r6            ; y = ey - 3
  LDI r5, 6
  LDI r6, 6
  LDI r22, 0xFFFF00
  RECTF r2, r4, r5, r6, r22

  ; decrement timer
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LOAD r5, r4
  LDI r6, 1
  SUB r5, r6
  STORE r4, r5

  JMP ds_next

ds_skip:
ds_next:
  LDI r6, 3
  ADD r3, r6
  LDI r6, 1
  SUB r12, r6
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r3, 0x2101
  LDI r12, 16

de_loop:
  JZ r12, de_done

  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LOAD r4, r4
  JZ r4, de_next

  LOAD r2, r3
  LDI r6, 3
  SUB r2, r6
  MOV r4, r3
  LDI r6, 1
  ADD r4, r6
  LOAD r4, r4
  LDI r6, 3
  SUB r4, r6
  LDI r5, 6
  LDI r6, 6
  LDI r22, 0xFF4444
  RECTF r2, r4, r5, r6, r22

de_next:
  LDI r6, 4
  ADD r3, r6
  LDI r6, 1
  SUB r12, r6
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r3, 0x2201
  LDI r4, 0x2200
  LOAD r12, r4

dt_loop:
  JZ r12, dt_done

  LOAD r2, r3
  LDI r6, 16
  MUL r2, r6
  MOV r4, r3
  LDI r6, 1
  ADD r4, r6
  LOAD r7, r4
  LDI r6, 16
  MUL r7, r6
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LOAD r4, r4

  ; color: 1=green, 2=red, 3=cyan
  LDI r6, 2
  CMP r4, r6
  BGE r0, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r6, 3
  CMP r4, r6
  JZ r0, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r5, 16
  LDI r6, 16
  RECTF r2, r7, r5, r6, r22

dt_next:
  LDI r6, 4
  ADD r3, r6
  LDI r6, 1
  SUB r12, r6
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r4, 0x2408
  LOAD r2, r4
  LDI r6, 16
  MUL r2, r6
  LDI r4, 0x2409
  LOAD r3, r4
  LDI r6, 16
  MUL r3, r6

  ; color by placing_type
  LDI r4, 0x240A
  LOAD r4, r4
  JZ r4, cur_white
  LDI r6, 2
  CMP r4, r6
  BGE r0, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r6, 3
  CMP r4, r6
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
  LDI r5, 16
  LDI r6, 2
  RECTF r2, r3, r5, r6, r22
  ; bottom edge (y+14)
  MOV r4, r3
  LDI r6, 14
  ADD r4, r6
  RECTF r2, r4, r5, r6, r22
  ; left edge (y+2, x, 2, 12)
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  LDI r5, 2
  LDI r6, 12
  RECTF r2, r4, r5, r6, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r4, r3
  LDI r6, 2
  ADD r4, r6
  MOV r5, r2
  LDI r6, 14
  ADD r5, r6
  LDI r6, 2
  LDI r7, 12
  RECTF r5, r4, r6, r7, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r4, 0x2400
  LOAD r2, r4
  LDI r6, 200
  CMP r2, r6
  BLT r0, gold_ok
  MOV r2, r6
gold_ok:
  LDI r3, 228
  LDI r5, 8
  LDI r6, 8
  LDI r22, 0xFFCC00
  RECTF r2, r3, r5, r6, r22

  ; Lives indicator (small red squares)
  LDI r4, 0x2401
  LOAD r12, r4
  LDI r3, 100
  LDI r5, 4
  LDI r6, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r12, lives_end
  LDI r7, 228
  RECTF r3, r7, r5, r6, r22
  LDI r7, 6
  ADD r3, r7
  LDI r7, 1
  SUB r12, r7
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r4, 0x2402
  LOAD r12, r4
  LDI r3, 4
  LDI r5, 4
  LDI r6, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r12, wave_end
  LDI r7, 248
  RECTF r3, r7, r5, r6, r22
  LDI r7, 6
  ADD r3, r7
  LDI r7, 1
  SUB r12, r7
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r2, 180
  LDI r3, 228
  LDI r5, 8
  LDI r6, 8
  LDI r22, 0x00CC00
  RECTF r2, r3, r5, r6, r22
  LDI r2, 200
  LDI r22, 0xCC0000
  RECTF r2, r3, r5, r6, r22
  LDI r2, 220
  LDI r22, 0x00CCCC
  RECTF r2, r3, r5, r6, r22

  RET
