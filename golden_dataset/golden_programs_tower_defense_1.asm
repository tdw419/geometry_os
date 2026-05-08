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

  LDI r1, 50
  LDI r15, 0x2400
  STORE r15, r1
  LDI r1, 20
  LDI r15, 0x2401
  STORE r15, r1
  LDI r1, 0
  LDI r15, 0x2402
  STORE r15, r1
  LDI r15, 0x2403
  STORE r15, r1
  LDI r15, 0x2405
  STORE r15, r1
  LDI r15, 0x2407
  STORE r15, r1
  LDI r15, 0x2408
  STORE r15, r1
  LDI r15, 0x2409
  STORE r15, r1
  LDI r15, 0x240A
  STORE r15, r1
  LDI r15, 0x2100
  STORE r15, r1
  LDI r15, 0x2200
  STORE r15, r1
  LDI r15, 0x2300
  STORE r15, r1

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r1, 10
  LDI r15, 0x2000
  STORE r15, r1

  ; wp0 (8, 40)
  LDI r1, 8
  LDI r15, 0x2001
  STORE r15, r1
  LDI r1, 40
  LDI r15, 0x2002
  STORE r15, r1
  ; wp1 (104, 40)
  LDI r1, 104
  LDI r15, 0x2003
  STORE r15, r1
  LDI r1, 40
  LDI r15, 0x2004
  STORE r15, r1
  ; wp2 (104, 104)
  LDI r1, 104
  LDI r15, 0x2005
  STORE r15, r1
  LDI r1, 104
  LDI r15, 0x2006
  STORE r15, r1
  ; wp3 (40, 104)
  LDI r1, 40
  LDI r15, 0x2007
  STORE r15, r1
  LDI r1, 104
  LDI r15, 0x2008
  STORE r15, r1
  ; wp4 (40, 168)
  LDI r1, 40
  LDI r15, 0x2009
  STORE r15, r1
  LDI r1, 168
  LDI r15, 0x200A
  STORE r15, r1
  ; wp5 (136, 168)
  LDI r1, 136
  LDI r15, 0x200B
  STORE r15, r1
  LDI r1, 168
  LDI r15, 0x200C
  STORE r15, r1
  ; wp6 (136, 72)
  LDI r1, 136
  LDI r15, 0x200D
  STORE r15, r1
  LDI r1, 72
  LDI r15, 0x200E
  STORE r15, r1
  ; wp7 (216, 72)
  LDI r1, 216
  LDI r15, 0x200F
  STORE r15, r1
  LDI r1, 72
  LDI r15, 0x2010
  STORE r15, r1
  ; wp8 (216, 168)
  LDI r1, 216
  LDI r15, 0x2011
  STORE r15, r1
  LDI r1, 168
  LDI r15, 0x2012
  STORE r15, r1
  ; wp9 (248, 168)
  LDI r1, 248
  LDI r15, 0x2013
  STORE r15, r1
  LDI r1, 168
  LDI r15, 0x2014
  STORE r15, r1

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r15, 0x2407
  LOAD r1, r15
  JNZ r1, game_over_screen

  ; clear screen dark green
  LDI r1, 0x1A3A1A
  FILL r1

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r1, 0x1A1A3A
  LDI r3, 0
  LDI r5, 224
  LDI r10, 256
  LDI r7, 32
  RECTF r3, r5, r10, r7, r1

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
  LDI r3, 0
  LDI r5, 32
  LDI r10, 112
  LDI r7, 16
  RECTF r3, r5, r10, r7, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r3, 96
  LDI r5, 32
  LDI r10, 16
  LDI r7, 80
  RECTF r3, r5, r10, r7, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r3, 32
  LDI r5, 96
  LDI r10, 80
  LDI r7, 16
  RECTF r3, r5, r10, r7, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r3, 32
  LDI r5, 96
  LDI r10, 16
  LDI r7, 80
  RECTF r3, r5, r10, r7, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r3, 32
  LDI r5, 160
  LDI r10, 112
  LDI r7, 16
  RECTF r3, r5, r10, r7, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r3, 128
  LDI r5, 64
  LDI r10, 16
  LDI r7, 112
  RECTF r3, r5, r10, r7, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r3, 128
  LDI r5, 64
  LDI r10, 96
  LDI r7, 16
  RECTF r3, r5, r10, r7, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r3, 208
  LDI r5, 64
  LDI r10, 16
  LDI r7, 112
  RECTF r3, r5, r10, r7, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r3, 208
  LDI r5, 160
  LDI r10, 48
  LDI r7, 16
  RECTF r3, r5, r10, r7, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r3, 0
  LDI r5, 32
  LDI r10, 4
  LDI r7, 16
  RECTF r3, r5, r10, r7, r22
  LDI r22, 0xCC0000
  LDI r3, 252
  LDI r5, 160
  RECTF r3, r5, r10, r7, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r2
  JZ r2, input_done

  LDI r7, 87
  CMP r2, r7
  JZ r14, input_up
  LDI r7, 119
  CMP r2, r7
  JZ r14, input_up
  LDI r7, 83
  CMP r2, r7
  JZ r14, input_down
  LDI r7, 115
  CMP r2, r7
  JZ r14, input_down
  LDI r7, 65
  CMP r2, r7
  JZ r14, input_left
  LDI r7, 97
  CMP r2, r7
  JZ r14, input_left
  LDI r7, 68
  CMP r2, r7
  JZ r14, input_right
  LDI r7, 100
  CMP r2, r7
  JZ r14, input_right
  LDI r7, 49
  CMP r2, r7
  JZ r14, input_sel1
  LDI r7, 50
  CMP r2, r7
  JZ r14, input_sel2
  LDI r7, 51
  CMP r2, r7
  JZ r14, input_sel3
  LDI r7, 32
  CMP r2, r7
  JZ r14, input_place
  LDI r7, 78
  CMP r2, r7
  JZ r14, input_newwave
  LDI r7, 110
  CMP r2, r7
  JZ r14, input_newwave
  LDI r7, 82
  CMP r2, r7
  JZ r14, do_restart
  LDI r7, 114
  CMP r2, r7
  JZ r14, do_restart
  JMP input_done

input_up:
  LDI r15, 0x2409
  LOAD r1, r15
  JZ r1, input_done
  LDI r7, 1
  SUB r1, r7
  STORE r15, r1
  JMP input_done

input_down:
  LDI r15, 0x2409
  LOAD r1, r15
  LDI r7, 13
  CMP r1, r7
  BGE r14, input_done
  LDI r7, 1
  ADD r1, r7
  STORE r15, r1
  JMP input_done

input_left:
  LDI r15, 0x2408
  LOAD r1, r15
  JZ r1, input_done
  LDI r7, 1
  SUB r1, r7
  STORE r15, r1
  JMP input_done

input_right:
  LDI r15, 0x2408
  LOAD r1, r15
  LDI r7, 15
  CMP r1, r7
  BGE r14, input_done
  LDI r7, 1
  ADD r1, r7
  STORE r15, r1
  JMP input_done

input_sel1:
  LDI r1, 1
  LDI r15, 0x240A
  STORE r15, r1
  JMP input_done

input_sel2:
  LDI r1, 2
  LDI r15, 0x240A
  STORE r15, r1
  JMP input_done

input_sel3:
  LDI r1, 3
  LDI r15, 0x240A
  STORE r15, r1
  JMP input_done

input_newwave:
  LDI r15, 0x2403
  LOAD r1, r15
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
  LDI r15, 0x240A
  LOAD r1, r15
  JZ r1, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r7, 2
  CMP r1, r7
  BGE r14, place_type2or3
  LDI r7, 10
  JMP place_check_gold
place_type2or3:
  LDI r7, 3
  CMP r1, r7
  JZ r14, place_type3
  LDI r7, 25
  JMP place_check_gold
place_type3:
  LDI r7, 15

place_check_gold:
  ; r7=cost, r1=type
  LDI r15, 0x2400
  LOAD r3, r15
  CMP r3, r7
  BLT r14, input_done

  LDI r15, 0x2200
  LOAD r5, r15
  LDI r2, 8
  CMP r5, r2
  BGE r14, input_done

  LDI r15, 0x2409
  LOAD r2, r15
  LDI r10, 14
  CMP r2, r10
  BGE r14, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r1, input_done

  ; deduct gold
  SUB r3, r7
  LDI r15, 0x2400
  STORE r15, r3

  ; slot addr = 0x2201 + count * 4
  LDI r15, 0x2200
  LOAD r5, r15
  LDI r2, 4
  MUL r5, r2
  LDI r10, 0x2201
  ADD r10, r5

  ; cell_x
  LDI r15, 0x2408
  LOAD r5, r15
  STORE r10, r5
  LDI r2, 1
  ADD r10, r2
  ; cell_y
  LDI r15, 0x2409
  LOAD r5, r15
  STORE r10, r5
  LDI r2, 1
  ADD r10, r2
  ; type
  STORE r10, r1
  LDI r2, 1
  ADD r10, r2
  ; cd_timer = 0
  LDI r5, 0
  STORE r10, r5

  ; increment tower count
  LDI r15, 0x2200
  LOAD r5, r15
  LDI r2, 1
  ADD r5, r2
  STORE r15, r5

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r1=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r15, 0x2408
  LOAD r12, r15
  LDI r15, 0x2409
  LOAD r9, r15
  LDI r15, 0x2200
  LOAD r8, r15
  LDI r5, 0x2201
  LDI r1, 0

ctc_loop:
  JZ r8, ctc_done
  LOAD r10, r5
  MOV r15, r5
  LDI r7, 1
  ADD r15, r7
  LOAD r7, r15
  CMP r10, r12
  JNZ r14, ctc_next
  CMP r7, r9
  JNZ r14, ctc_next
  LDI r1, 1
  JMP ctc_done
ctc_next:
  LDI r7, 4
  ADD r5, r7
  LDI r7, 1
  SUB r8, r7
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r15, 0x2402
  LOAD r1, r15
  LDI r7, 1
  ADD r1, r7
  STORE r15, r1
  ; enemies_per_wave = 3 + wave*2
  MOV r10, r1
  LDI r7, 2
  MUL r10, r7
  LDI r7, 3
  ADD r10, r7
  LDI r15, 0x2406
  STORE r15, r10
  LDI r1, 1
  LDI r15, 0x2403
  STORE r15, r1
  LDI r1, 0
  LDI r15, 0x2404
  STORE r15, r1
  LDI r15, 0x2405
  STORE r15, r1
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r15, 0x2403
  LOAD r1, r15
  JZ r1, spawn_done

  LDI r15, 0x2405
  LOAD r3, r15
  LDI r15, 0x2406
  LOAD r5, r15
  CMP r3, r5
  BGE r14, spawn_check_done

  LDI r15, 0x2404
  LOAD r1, r15
  JZ r1, do_spawn
  LDI r7, 1
  SUB r1, r7
  STORE r15, r1
  JMP spawn_done

do_spawn:
  LDI r5, 0x2101
  LDI r8, 16

find_slot:
  JZ r8, spawn_done
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LOAD r15, r15
  JNZ r15, find_next

  ; spawn at wp0 center (8, 40)
  LDI r10, 8
  STORE r5, r10
  MOV r15, r5
  LDI r7, 1
  ADD r15, r7
  LDI r10, 40
  STORE r15, r10
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  ; hp = 2 + wave
  LDI r10, 0x2402
  LOAD r10, r10
  LDI r7, 2
  ADD r10, r7
  STORE r15, r10
  MOV r15, r5
  LDI r7, 3
  ADD r15, r7
  LDI r10, 1
  STORE r15, r10

  ; increment spawned
  LDI r15, 0x2405
  LOAD r10, r15
  LDI r7, 1
  ADD r10, r7
  STORE r15, r10
  ; spawn_timer = 30
  LDI r10, 30
  LDI r15, 0x2404
  STORE r15, r10
  ; increment enemy_count
  LDI r15, 0x2100
  LOAD r10, r15
  LDI r7, 1
  ADD r10, r7
  STORE r15, r10

  JMP spawn_done

find_next:
  LDI r7, 4
  ADD r5, r7
  LDI r7, 1
  SUB r8, r7
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r5, 0x2101
  LDI r8, 16
  LDI r1, 0
chk_alive:
  JZ r8, chk_done
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LOAD r15, r15
  JZ r15, chk_next
  LDI r7, 1
  ADD r1, r7
chk_next:
  LDI r7, 4
  ADD r5, r7
  LDI r7, 1
  SUB r8, r7
  JMP chk_alive
chk_done:
  JNZ r1, spawn_done
  LDI r1, 0
  LDI r15, 0x2403
  STORE r15, r1

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r5, 0x2101
  LDI r8, 16

me_loop:
  JZ r8, me_done

  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LOAD r15, r15
  JZ r15, me_next

  MOV r15, r5
  LDI r7, 3
  ADD r15, r7
  LOAD r4, r15

  LDI r7, 10
  CMP r4, r7
  BGE r14, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r10, r4
  LDI r7, 2
  MUL r10, r7
  LDI r15, 0x2001
  ADD r15, r10
  LOAD r13, r15
  LDI r7, 1
  ADD r15, r7
  LOAD r6, r15

  LOAD r12, r5
  MOV r15, r5
  LDI r7, 1
  ADD r15, r7
  LOAD r9, r15

  ; dx
  MOV r10, r13
  SUB r10, r12
  JNZ r10, me_move_h

  ; dy
  MOV r10, r6
  SUB r10, r9
  JZ r10, me_reached

  MOV r15, r10
  LDI r7, 31
  SAR r15, r7
  JZ r15, me_down
  LDI r7, 1
  SUB r9, r7
  JMP me_store
me_down:
  LDI r7, 1
  ADD r9, r7
  JMP me_store

me_move_h:
  MOV r15, r10
  LDI r7, 31
  SAR r15, r7
  JZ r15, me_right
  LDI r7, 1
  SUB r12, r7
  JMP me_store
me_right:
  LDI r7, 1
  ADD r12, r7
  JMP me_store

me_reached:
  MOV r15, r5
  LDI r7, 3
  ADD r15, r7
  LOAD r4, r15
  LDI r7, 1
  ADD r4, r7
  STORE r15, r4
  JMP me_next

enemy_escaped:
  LDI r15, 0x2401
  LOAD r10, r15
  LDI r7, 1
  SUB r10, r7
  STORE r15, r10
  JZ r10, set_game_over
  ; kill enemy
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LDI r10, 0
  STORE r15, r10
  LDI r15, 0x2100
  LOAD r10, r15
  LDI r7, 1
  SUB r10, r7
  STORE r15, r10
  JMP me_next

set_game_over:
  LDI r10, 1
  LDI r15, 0x2407
  STORE r15, r10
  JMP me_next

me_store:
  STORE r5, r12
  MOV r15, r5
  LDI r7, 1
  ADD r15, r7
  STORE r15, r9

me_next:
  LDI r7, 4
  ADD r5, r7
  LDI r7, 1
  SUB r8, r7
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r5, 0x2201
  LDI r15, 0x2200
  LOAD r8, r15

ut_loop:
  JZ r8, ut_done

  ; decrement cd
  MOV r15, r5
  LDI r7, 3
  ADD r15, r7
  LOAD r15, r15
  JZ r15, ut_ready
  LDI r7, 1
  SUB r15, r7
  MOV r10, r5
  LDI r7, 3
  ADD r10, r7
  STORE r10, r15
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r10, r5
  LDI r7, 16
  MUL r10, r7
  LDI r7, 8
  ADD r10, r7
  MOV r15, r5
  LDI r7, 1
  ADD r15, r7
  LOAD r7, r15
  LDI r2, 16
  MUL r7, r2
  LDI r2, 8
  ADD r7, r2

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r15, r5
  LDI r2, 2
  ADD r15, r2
  LOAD r15, r15
  LDI r2, 2
  CMP r15, r2
  BGE r14, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r2, 3
  CMP r15, r2
  JZ r14, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r0, 0xFFFFFFFF
  LDI r12, 0
  LDI r13, 0x2101
  LDI r6, 16

ut_sl:
  JZ r6, ut_sd
  MOV r15, r13
  LDI r2, 2
  ADD r15, r2
  LOAD r15, r15
  JZ r15, ut_sn

  LOAD r1, r13
  MOV r15, r13
  LDI r2, 1
  ADD r15, r2
  LOAD r3, r15

  MOV r15, r1
  SUB r15, r10
  MOV r2, r15
  MUL r2, r2
  MOV r9, r3
  SUB r9, r7
  MOV r15, r9
  MUL r15, r15
  ADD r2, r15

  CMP r2, r20
  BGE r14, ut_sn
  CMP r2, r0
  BGE r14, ut_sn
  MOV r0, r2
  MOV r11, r13
  LDI r12, 1

ut_sn:
  LDI r2, 4
  ADD r13, r2
  LDI r2, 1
  SUB r6, r2
  JMP ut_sl

ut_sd:
  JZ r12, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r15, r5
  LDI r2, 2
  ADD r15, r2
  LOAD r15, r15
  LDI r2, 2
  CMP r15, r2
  BGE r14, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r2, 3
  CMP r15, r2
  JZ r14, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r15, r11
  LDI r2, 2
  ADD r15, r2
  LOAD r2, r15
  CMP r2, r21
  BLT r14, ut_kill
  SUB r2, r21
  STORE r15, r2
  JMP ut_cd

ut_kill:
  LDI r2, 0
  STORE r15, r2
  LDI r15, 0x2400
  LOAD r2, r15
  LDI r10, 5
  ADD r2, r10
  STORE r15, r2
  LDI r15, 0x2100
  LOAD r2, r15
  LDI r10, 1
  SUB r2, r10
  STORE r15, r2
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r15, r5
  LDI r2, 2
  ADD r15, r2
  LOAD r15, r15
  LDI r2, 2
  CMP r15, r2
  BGE r14, ut_c2or3
  LDI r2, 20
  JMP ut_scd
ut_c2or3:
  LDI r2, 3
  CMP r15, r2
  JZ r14, ut_c3
  LDI r2, 45
  JMP ut_scd
ut_c3:
  LDI r2, 30

ut_scd:
  MOV r15, r5
  LDI r10, 3
  ADD r15, r10
  STORE r15, r2

ut_next:
  LDI r7, 4
  ADD r5, r7
  LDI r7, 1
  SUB r8, r7
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r11=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r5, 0x2301
  LDI r8, 8
cs_loop:
  JZ r8, cs_done
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LOAD r15, r15
  JNZ r15, cs_next

  LOAD r15, r11
  STORE r5, r15
  MOV r10, r5
  LDI r7, 1
  ADD r10, r7
  MOV r15, r11
  LDI r7, 1
  ADD r15, r7
  LOAD r15, r15
  STORE r10, r15
  MOV r10, r5
  LDI r7, 2
  ADD r10, r7
  LDI r15, 5
  STORE r10, r15
  JMP cs_done

cs_next:
  LDI r7, 3
  ADD r5, r7
  LDI r7, 1
  SUB r8, r7
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r5=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r5, 0x2301
  LDI r8, 8

ds_loop:
  JZ r8, ds_done

  ; check timer (offset 2 from r5)
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LOAD r15, r15
  JZ r15, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r3, r5           ; r3 = ex
  LDI r7, 3
  SUB r3, r7            ; x = ex - 3
  MOV r15, r5
  LDI r7, 1
  ADD r15, r7
  LOAD r15, r15           ; r15 = ey (NOT r5)
  LDI r7, 3
  SUB r15, r7            ; y = ey - 3
  LDI r10, 6
  LDI r7, 6
  LDI r22, 0xFFFF00
  RECTF r3, r15, r10, r7, r22

  ; decrement timer
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LOAD r10, r15
  LDI r7, 1
  SUB r10, r7
  STORE r15, r10

  JMP ds_next

ds_skip:
ds_next:
  LDI r7, 3
  ADD r5, r7
  LDI r7, 1
  SUB r8, r7
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r5, 0x2101
  LDI r8, 16

de_loop:
  JZ r8, de_done

  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LOAD r15, r15
  JZ r15, de_next

  LOAD r3, r5
  LDI r7, 3
  SUB r3, r7
  MOV r15, r5
  LDI r7, 1
  ADD r15, r7
  LOAD r15, r15
  LDI r7, 3
  SUB r15, r7
  LDI r10, 6
  LDI r7, 6
  LDI r22, 0xFF4444
  RECTF r3, r15, r10, r7, r22

de_next:
  LDI r7, 4
  ADD r5, r7
  LDI r7, 1
  SUB r8, r7
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r5, 0x2201
  LDI r15, 0x2200
  LOAD r8, r15

dt_loop:
  JZ r8, dt_done

  LOAD r3, r5
  LDI r7, 16
  MUL r3, r7
  MOV r15, r5
  LDI r7, 1
  ADD r15, r7
  LOAD r2, r15
  LDI r7, 16
  MUL r2, r7
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LOAD r15, r15

  ; color: 1=green, 2=red, 3=cyan
  LDI r7, 2
  CMP r15, r7
  BGE r14, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r7, 3
  CMP r15, r7
  JZ r14, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r10, 16
  LDI r7, 16
  RECTF r3, r2, r10, r7, r22

dt_next:
  LDI r7, 4
  ADD r5, r7
  LDI r7, 1
  SUB r8, r7
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r15, 0x2408
  LOAD r3, r15
  LDI r7, 16
  MUL r3, r7
  LDI r15, 0x2409
  LOAD r5, r15
  LDI r7, 16
  MUL r5, r7

  ; color by placing_type
  LDI r15, 0x240A
  LOAD r15, r15
  JZ r15, cur_white
  LDI r7, 2
  CMP r15, r7
  BGE r14, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r7, 3
  CMP r15, r7
  JZ r14, cur_t3
  LDI r22, 0xFF0000
  JMP cur_draw
cur_t3:
  LDI r22, 0x00FFFF
  JMP cur_draw
cur_white:
  LDI r22, 0xFFFFFF

cur_draw:
  ; top edge (y, x, 16, 2)
  LDI r10, 16
  LDI r7, 2
  RECTF r3, r5, r10, r7, r22
  ; bottom edge (y+14)
  MOV r15, r5
  LDI r7, 14
  ADD r15, r7
  RECTF r3, r15, r10, r7, r22
  ; left edge (y+2, x, 2, 12)
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  LDI r10, 2
  LDI r7, 12
  RECTF r3, r15, r10, r7, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r15, r5
  LDI r7, 2
  ADD r15, r7
  MOV r10, r3
  LDI r7, 14
  ADD r10, r7
  LDI r7, 2
  LDI r2, 12
  RECTF r10, r15, r7, r2, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r15, 0x2400
  LOAD r3, r15
  LDI r7, 200
  CMP r3, r7
  BLT r14, gold_ok
  MOV r3, r7
gold_ok:
  LDI r5, 228
  LDI r10, 8
  LDI r7, 8
  LDI r22, 0xFFCC00
  RECTF r3, r5, r10, r7, r22

  ; Lives indicator (small red squares)
  LDI r15, 0x2401
  LOAD r8, r15
  LDI r5, 100
  LDI r10, 4
  LDI r7, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r8, lives_end
  LDI r2, 228
  RECTF r5, r2, r10, r7, r22
  LDI r2, 6
  ADD r5, r2
  LDI r2, 1
  SUB r8, r2
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r15, 0x2402
  LOAD r8, r15
  LDI r5, 4
  LDI r10, 4
  LDI r7, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r8, wave_end
  LDI r2, 248
  RECTF r5, r2, r10, r7, r22
  LDI r2, 6
  ADD r5, r2
  LDI r2, 1
  SUB r8, r2
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r3, 180
  LDI r5, 228
  LDI r10, 8
  LDI r7, 8
  LDI r22, 0x00CC00
  RECTF r3, r5, r10, r7, r22
  LDI r3, 200
  LDI r22, 0xCC0000
  RECTF r3, r5, r10, r7, r22
  LDI r3, 220
  LDI r22, 0x00CCCC
  RECTF r3, r5, r10, r7, r22

  RET
