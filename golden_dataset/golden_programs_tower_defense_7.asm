; DESCRIPTION: Render a red object at the screen.

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

  LDI r4, 50
  LDI r12, 0x2400
  STORE r12, r4
  LDI r4, 20
  LDI r12, 0x2401
  STORE r12, r4
  LDI r4, 0
  LDI r12, 0x2402
  STORE r12, r4
  LDI r12, 0x2403
  STORE r12, r4
  LDI r12, 0x2405
  STORE r12, r4
  LDI r12, 0x2407
  STORE r12, r4
  LDI r12, 0x2408
  STORE r12, r4
  LDI r12, 0x2409
  STORE r12, r4
  LDI r12, 0x240A
  STORE r12, r4
  LDI r12, 0x2100
  STORE r12, r4
  LDI r12, 0x2200
  STORE r12, r4
  LDI r12, 0x2300
  STORE r12, r4

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r4, 10
  LDI r12, 0x2000
  STORE r12, r4

  ; wp0 (8, 40)
  LDI r4, 8
  LDI r12, 0x2001
  STORE r12, r4
  LDI r4, 40
  LDI r12, 0x2002
  STORE r12, r4
  ; wp1 (104, 40)
  LDI r4, 104
  LDI r12, 0x2003
  STORE r12, r4
  LDI r4, 40
  LDI r12, 0x2004
  STORE r12, r4
  ; wp2 (104, 104)
  LDI r4, 104
  LDI r12, 0x2005
  STORE r12, r4
  LDI r4, 104
  LDI r12, 0x2006
  STORE r12, r4
  ; wp3 (40, 104)
  LDI r4, 40
  LDI r12, 0x2007
  STORE r12, r4
  LDI r4, 104
  LDI r12, 0x2008
  STORE r12, r4
  ; wp4 (40, 168)
  LDI r4, 40
  LDI r12, 0x2009
  STORE r12, r4
  LDI r4, 168
  LDI r12, 0x200A
  STORE r12, r4
  ; wp5 (136, 168)
  LDI r4, 136
  LDI r12, 0x200B
  STORE r12, r4
  LDI r4, 168
  LDI r12, 0x200C
  STORE r12, r4
  ; wp6 (136, 72)
  LDI r4, 136
  LDI r12, 0x200D
  STORE r12, r4
  LDI r4, 72
  LDI r12, 0x200E
  STORE r12, r4
  ; wp7 (216, 72)
  LDI r4, 216
  LDI r12, 0x200F
  STORE r12, r4
  LDI r4, 72
  LDI r12, 0x2010
  STORE r12, r4
  ; wp8 (216, 168)
  LDI r4, 216
  LDI r12, 0x2011
  STORE r12, r4
  LDI r4, 168
  LDI r12, 0x2012
  STORE r12, r4
  ; wp9 (248, 168)
  LDI r4, 248
  LDI r12, 0x2013
  STORE r12, r4
  LDI r4, 168
  LDI r12, 0x2014
  STORE r12, r4

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r12, 0x2407
  LOAD r4, r12
  JNZ r4, game_over_screen

  ; clear screen dark green
  LDI r4, 0x1A3A1A
  FILL r4

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r4, 0x1A1A3A
  LDI r13, 0
  LDI r7, 224
  LDI r1, 256
  LDI r14, 32
  RECTF r13, r7, r1, r14, r4

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
  LDI r4, 0x550000
  FILL r4
  FRAME
  IKEY r4
  JZ r4, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r13, 0
  LDI r7, 32
  LDI r1, 112
  LDI r14, 16
  RECTF r13, r7, r1, r14, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r13, 96
  LDI r7, 32
  LDI r1, 16
  LDI r14, 80
  RECTF r13, r7, r1, r14, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r13, 32
  LDI r7, 96
  LDI r1, 80
  LDI r14, 16
  RECTF r13, r7, r1, r14, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r13, 32
  LDI r7, 96
  LDI r1, 16
  LDI r14, 80
  RECTF r13, r7, r1, r14, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r13, 32
  LDI r7, 160
  LDI r1, 112
  LDI r14, 16
  RECTF r13, r7, r1, r14, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r13, 128
  LDI r7, 64
  LDI r1, 16
  LDI r14, 112
  RECTF r13, r7, r1, r14, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r13, 128
  LDI r7, 64
  LDI r1, 96
  LDI r14, 16
  RECTF r13, r7, r1, r14, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r13, 208
  LDI r7, 64
  LDI r1, 16
  LDI r14, 112
  RECTF r13, r7, r1, r14, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r13, 208
  LDI r7, 160
  LDI r1, 48
  LDI r14, 16
  RECTF r13, r7, r1, r14, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r13, 0
  LDI r7, 32
  LDI r1, 4
  LDI r14, 16
  RECTF r13, r7, r1, r14, r22
  LDI r22, 0xCC0000
  LDI r13, 252
  LDI r7, 160
  RECTF r13, r7, r1, r14, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r8
  JZ r8, input_done

  LDI r14, 87
  CMP r8, r14
  JZ r2, input_up
  LDI r14, 119
  CMP r8, r14
  JZ r2, input_up
  LDI r14, 83
  CMP r8, r14
  JZ r2, input_down
  LDI r14, 115
  CMP r8, r14
  JZ r2, input_down
  LDI r14, 65
  CMP r8, r14
  JZ r2, input_left
  LDI r14, 97
  CMP r8, r14
  JZ r2, input_left
  LDI r14, 68
  CMP r8, r14
  JZ r2, input_right
  LDI r14, 100
  CMP r8, r14
  JZ r2, input_right
  LDI r14, 49
  CMP r8, r14
  JZ r2, input_sel1
  LDI r14, 50
  CMP r8, r14
  JZ r2, input_sel2
  LDI r14, 51
  CMP r8, r14
  JZ r2, input_sel3
  LDI r14, 32
  CMP r8, r14
  JZ r2, input_place
  LDI r14, 78
  CMP r8, r14
  JZ r2, input_newwave
  LDI r14, 110
  CMP r8, r14
  JZ r2, input_newwave
  LDI r14, 82
  CMP r8, r14
  JZ r2, do_restart
  LDI r14, 114
  CMP r8, r14
  JZ r2, do_restart
  JMP input_done

input_up:
  LDI r12, 0x2409
  LOAD r4, r12
  JZ r4, input_done
  LDI r14, 1
  SUB r4, r14
  STORE r12, r4
  JMP input_done

input_down:
  LDI r12, 0x2409
  LOAD r4, r12
  LDI r14, 13
  CMP r4, r14
  BGE r2, input_done
  LDI r14, 1
  ADD r4, r14
  STORE r12, r4
  JMP input_done

input_left:
  LDI r12, 0x2408
  LOAD r4, r12
  JZ r4, input_done
  LDI r14, 1
  SUB r4, r14
  STORE r12, r4
  JMP input_done

input_right:
  LDI r12, 0x2408
  LOAD r4, r12
  LDI r14, 15
  CMP r4, r14
  BGE r2, input_done
  LDI r14, 1
  ADD r4, r14
  STORE r12, r4
  JMP input_done

input_sel1:
  LDI r4, 1
  LDI r12, 0x240A
  STORE r12, r4
  JMP input_done

input_sel2:
  LDI r4, 2
  LDI r12, 0x240A
  STORE r12, r4
  JMP input_done

input_sel3:
  LDI r4, 3
  LDI r12, 0x240A
  STORE r12, r4
  JMP input_done

input_newwave:
  LDI r12, 0x2403
  LOAD r4, r12
  JNZ r4, input_done
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
  LOAD r4, r12
  JZ r4, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r14, 2
  CMP r4, r14
  BGE r2, place_type2or3
  LDI r14, 10
  JMP place_check_gold
place_type2or3:
  LDI r14, 3
  CMP r4, r14
  JZ r2, place_type3
  LDI r14, 25
  JMP place_check_gold
place_type3:
  LDI r14, 15

place_check_gold:
  ; r14=cost, r4=type
  LDI r12, 0x2400
  LOAD r13, r12
  CMP r13, r14
  BLT r2, input_done

  LDI r12, 0x2200
  LOAD r7, r12
  LDI r8, 8
  CMP r7, r8
  BGE r2, input_done

  LDI r12, 0x2409
  LOAD r8, r12
  LDI r1, 14
  CMP r8, r1
  BGE r2, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r4, input_done

  ; deduct gold
  SUB r13, r14
  LDI r12, 0x2400
  STORE r12, r13

  ; slot addr = 0x2201 + count * 4
  LDI r12, 0x2200
  LOAD r7, r12
  LDI r8, 4
  MUL r7, r8
  LDI r1, 0x2201
  ADD r1, r7

  ; cell_x
  LDI r12, 0x2408
  LOAD r7, r12
  STORE r1, r7
  LDI r8, 1
  ADD r1, r8
  ; cell_y
  LDI r12, 0x2409
  LOAD r7, r12
  STORE r1, r7
  LDI r8, 1
  ADD r1, r8
  ; type
  STORE r1, r4
  LDI r8, 1
  ADD r1, r8
  ; cd_timer = 0
  LDI r7, 0
  STORE r1, r7

  ; increment tower count
  LDI r12, 0x2200
  LOAD r7, r12
  LDI r8, 1
  ADD r7, r8
  STORE r12, r7

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r4=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r12, 0x2408
  LOAD r0, r12
  LDI r12, 0x2409
  LOAD r6, r12
  LDI r12, 0x2200
  LOAD r15, r12
  LDI r7, 0x2201
  LDI r4, 0

ctc_loop:
  JZ r15, ctc_done
  LOAD r1, r7
  MOV r12, r7
  LDI r14, 1
  ADD r12, r14
  LOAD r14, r12
  CMP r1, r0
  JNZ r2, ctc_next
  CMP r14, r6
  JNZ r2, ctc_next
  LDI r4, 1
  JMP ctc_done
ctc_next:
  LDI r14, 4
  ADD r7, r14
  LDI r14, 1
  SUB r15, r14
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r12, 0x2402
  LOAD r4, r12
  LDI r14, 1
  ADD r4, r14
  STORE r12, r4
  ; enemies_per_wave = 3 + wave*2
  MOV r1, r4
  LDI r14, 2
  MUL r1, r14
  LDI r14, 3
  ADD r1, r14
  LDI r12, 0x2406
  STORE r12, r1
  LDI r4, 1
  LDI r12, 0x2403
  STORE r12, r4
  LDI r4, 0
  LDI r12, 0x2404
  STORE r12, r4
  LDI r12, 0x2405
  STORE r12, r4
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r12, 0x2403
  LOAD r4, r12
  JZ r4, spawn_done

  LDI r12, 0x2405
  LOAD r13, r12
  LDI r12, 0x2406
  LOAD r7, r12
  CMP r13, r7
  BGE r2, spawn_check_done

  LDI r12, 0x2404
  LOAD r4, r12
  JZ r4, do_spawn
  LDI r14, 1
  SUB r4, r14
  STORE r12, r4
  JMP spawn_done

do_spawn:
  LDI r7, 0x2101
  LDI r15, 16

find_slot:
  JZ r15, spawn_done
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LOAD r12, r12
  JNZ r12, find_next

  ; spawn at wp0 center (8, 40)
  LDI r1, 8
  STORE r7, r1
  MOV r12, r7
  LDI r14, 1
  ADD r12, r14
  LDI r1, 40
  STORE r12, r1
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  ; hp = 2 + wave
  LDI r1, 0x2402
  LOAD r1, r1
  LDI r14, 2
  ADD r1, r14
  STORE r12, r1
  MOV r12, r7
  LDI r14, 3
  ADD r12, r14
  LDI r1, 1
  STORE r12, r1

  ; increment spawned
  LDI r12, 0x2405
  LOAD r1, r12
  LDI r14, 1
  ADD r1, r14
  STORE r12, r1
  ; spawn_timer = 30
  LDI r1, 30
  LDI r12, 0x2404
  STORE r12, r1
  ; increment enemy_count
  LDI r12, 0x2100
  LOAD r1, r12
  LDI r14, 1
  ADD r1, r14
  STORE r12, r1

  JMP spawn_done

find_next:
  LDI r14, 4
  ADD r7, r14
  LDI r14, 1
  SUB r15, r14
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r7, 0x2101
  LDI r15, 16
  LDI r4, 0
chk_alive:
  JZ r15, chk_done
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LOAD r12, r12
  JZ r12, chk_next
  LDI r14, 1
  ADD r4, r14
chk_next:
  LDI r14, 4
  ADD r7, r14
  LDI r14, 1
  SUB r15, r14
  JMP chk_alive
chk_done:
  JNZ r4, spawn_done
  LDI r4, 0
  LDI r12, 0x2403
  STORE r12, r4

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r7, 0x2101
  LDI r15, 16

me_loop:
  JZ r15, me_done

  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LOAD r12, r12
  JZ r12, me_next

  MOV r12, r7
  LDI r14, 3
  ADD r12, r14
  LOAD r11, r12

  LDI r14, 10
  CMP r11, r14
  BGE r2, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r1, r11
  LDI r14, 2
  MUL r1, r14
  LDI r12, 0x2001
  ADD r12, r1
  LOAD r9, r12
  LDI r14, 1
  ADD r12, r14
  LOAD r5, r12

  LOAD r0, r7
  MOV r12, r7
  LDI r14, 1
  ADD r12, r14
  LOAD r6, r12

  ; dx
  MOV r1, r9
  SUB r1, r0
  JNZ r1, me_move_h

  ; dy
  MOV r1, r5
  SUB r1, r6
  JZ r1, me_reached

  MOV r12, r1
  LDI r14, 31
  SAR r12, r14
  JZ r12, me_down
  LDI r14, 1
  SUB r6, r14
  JMP me_store
me_down:
  LDI r14, 1
  ADD r6, r14
  JMP me_store

me_move_h:
  MOV r12, r1
  LDI r14, 31
  SAR r12, r14
  JZ r12, me_right
  LDI r14, 1
  SUB r0, r14
  JMP me_store
me_right:
  LDI r14, 1
  ADD r0, r14
  JMP me_store

me_reached:
  MOV r12, r7
  LDI r14, 3
  ADD r12, r14
  LOAD r11, r12
  LDI r14, 1
  ADD r11, r14
  STORE r12, r11
  JMP me_next

enemy_escaped:
  LDI r12, 0x2401
  LOAD r1, r12
  LDI r14, 1
  SUB r1, r14
  STORE r12, r1
  JZ r1, set_game_over
  ; kill enemy
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LDI r1, 0
  STORE r12, r1
  LDI r12, 0x2100
  LOAD r1, r12
  LDI r14, 1
  SUB r1, r14
  STORE r12, r1
  JMP me_next

set_game_over:
  LDI r1, 1
  LDI r12, 0x2407
  STORE r12, r1
  JMP me_next

me_store:
  STORE r7, r0
  MOV r12, r7
  LDI r14, 1
  ADD r12, r14
  STORE r12, r6

me_next:
  LDI r14, 4
  ADD r7, r14
  LDI r14, 1
  SUB r15, r14
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r7, 0x2201
  LDI r12, 0x2200
  LOAD r15, r12

ut_loop:
  JZ r15, ut_done

  ; decrement cd
  MOV r12, r7
  LDI r14, 3
  ADD r12, r14
  LOAD r12, r12
  JZ r12, ut_ready
  LDI r14, 1
  SUB r12, r14
  MOV r1, r7
  LDI r14, 3
  ADD r1, r14
  STORE r1, r12
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r1, r7
  LDI r14, 16
  MUL r1, r14
  LDI r14, 8
  ADD r1, r14
  MOV r12, r7
  LDI r14, 1
  ADD r12, r14
  LOAD r14, r12
  LDI r8, 16
  MUL r14, r8
  LDI r8, 8
  ADD r14, r8

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r12, r7
  LDI r8, 2
  ADD r12, r8
  LOAD r12, r12
  LDI r8, 2
  CMP r12, r8
  BGE r2, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r8, 3
  CMP r12, r8
  JZ r2, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r10, 0xFFFFFFFF
  LDI r0, 0
  LDI r9, 0x2101
  LDI r5, 16

ut_sl:
  JZ r5, ut_sd
  MOV r12, r9
  LDI r8, 2
  ADD r12, r8
  LOAD r12, r12
  JZ r12, ut_sn

  LOAD r4, r9
  MOV r12, r9
  LDI r8, 1
  ADD r12, r8
  LOAD r13, r12

  MOV r12, r4
  SUB r12, r1
  MOV r8, r12
  MUL r8, r8
  MOV r6, r13
  SUB r6, r14
  MOV r12, r6
  MUL r12, r12
  ADD r8, r12

  CMP r8, r20
  BGE r2, ut_sn
  CMP r8, r10
  BGE r2, ut_sn
  MOV r10, r8
  MOV r3, r9
  LDI r0, 1

ut_sn:
  LDI r8, 4
  ADD r9, r8
  LDI r8, 1
  SUB r5, r8
  JMP ut_sl

ut_sd:
  JZ r0, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r12, r7
  LDI r8, 2
  ADD r12, r8
  LOAD r12, r12
  LDI r8, 2
  CMP r12, r8
  BGE r2, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r8, 3
  CMP r12, r8
  JZ r2, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r12, r3
  LDI r8, 2
  ADD r12, r8
  LOAD r8, r12
  CMP r8, r21
  BLT r2, ut_kill
  SUB r8, r21
  STORE r12, r8
  JMP ut_cd

ut_kill:
  LDI r8, 0
  STORE r12, r8
  LDI r12, 0x2400
  LOAD r8, r12
  LDI r1, 5
  ADD r8, r1
  STORE r12, r8
  LDI r12, 0x2100
  LOAD r8, r12
  LDI r1, 1
  SUB r8, r1
  STORE r12, r8
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r12, r7
  LDI r8, 2
  ADD r12, r8
  LOAD r12, r12
  LDI r8, 2
  CMP r12, r8
  BGE r2, ut_c2or3
  LDI r8, 20
  JMP ut_scd
ut_c2or3:
  LDI r8, 3
  CMP r12, r8
  JZ r2, ut_c3
  LDI r8, 45
  JMP ut_scd
ut_c3:
  LDI r8, 30

ut_scd:
  MOV r12, r7
  LDI r1, 3
  ADD r12, r1
  STORE r12, r8

ut_next:
  LDI r14, 4
  ADD r7, r14
  LDI r14, 1
  SUB r15, r14
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r3=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r7, 0x2301
  LDI r15, 8
cs_loop:
  JZ r15, cs_done
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LOAD r12, r12
  JNZ r12, cs_next

  LOAD r12, r3
  STORE r7, r12
  MOV r1, r7
  LDI r14, 1
  ADD r1, r14
  MOV r12, r3
  LDI r14, 1
  ADD r12, r14
  LOAD r12, r12
  STORE r1, r12
  MOV r1, r7
  LDI r14, 2
  ADD r1, r14
  LDI r12, 5
  STORE r1, r12
  JMP cs_done

cs_next:
  LDI r14, 3
  ADD r7, r14
  LDI r14, 1
  SUB r15, r14
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r7=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r7, 0x2301
  LDI r15, 8

ds_loop:
  JZ r15, ds_done

  ; check timer (offset 2 from r7)
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LOAD r12, r12
  JZ r12, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r13, r7           ; r13 = ex
  LDI r14, 3
  SUB r13, r14            ; x = ex - 3
  MOV r12, r7
  LDI r14, 1
  ADD r12, r14
  LOAD r12, r12           ; r12 = ey (NOT r7)
  LDI r14, 3
  SUB r12, r14            ; y = ey - 3
  LDI r1, 6
  LDI r14, 6
  LDI r22, 0xFFFF00
  RECTF r13, r12, r1, r14, r22

  ; decrement timer
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LOAD r1, r12
  LDI r14, 1
  SUB r1, r14
  STORE r12, r1

  JMP ds_next

ds_skip:
ds_next:
  LDI r14, 3
  ADD r7, r14
  LDI r14, 1
  SUB r15, r14
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r7, 0x2101
  LDI r15, 16

de_loop:
  JZ r15, de_done

  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LOAD r12, r12
  JZ r12, de_next

  LOAD r13, r7
  LDI r14, 3
  SUB r13, r14
  MOV r12, r7
  LDI r14, 1
  ADD r12, r14
  LOAD r12, r12
  LDI r14, 3
  SUB r12, r14
  LDI r1, 6
  LDI r14, 6
  LDI r22, 0xFF4444
  RECTF r13, r12, r1, r14, r22

de_next:
  LDI r14, 4
  ADD r7, r14
  LDI r14, 1
  SUB r15, r14
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r7, 0x2201
  LDI r12, 0x2200
  LOAD r15, r12

dt_loop:
  JZ r15, dt_done

  LOAD r13, r7
  LDI r14, 16
  MUL r13, r14
  MOV r12, r7
  LDI r14, 1
  ADD r12, r14
  LOAD r8, r12
  LDI r14, 16
  MUL r8, r14
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LOAD r12, r12

  ; color: 1=green, 2=red, 3=cyan
  LDI r14, 2
  CMP r12, r14
  BGE r2, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r14, 3
  CMP r12, r14
  JZ r2, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r1, 16
  LDI r14, 16
  RECTF r13, r8, r1, r14, r22

dt_next:
  LDI r14, 4
  ADD r7, r14
  LDI r14, 1
  SUB r15, r14
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r12, 0x2408
  LOAD r13, r12
  LDI r14, 16
  MUL r13, r14
  LDI r12, 0x2409
  LOAD r7, r12
  LDI r14, 16
  MUL r7, r14

  ; color by placing_type
  LDI r12, 0x240A
  LOAD r12, r12
  JZ r12, cur_white
  LDI r14, 2
  CMP r12, r14
  BGE r2, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r14, 3
  CMP r12, r14
  JZ r2, cur_t3
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
  LDI r14, 2
  RECTF r13, r7, r1, r14, r22
  ; bottom edge (y+14)
  MOV r12, r7
  LDI r14, 14
  ADD r12, r14
  RECTF r13, r12, r1, r14, r22
  ; left edge (y+2, x, 2, 12)
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  LDI r1, 2
  LDI r14, 12
  RECTF r13, r12, r1, r14, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r12, r7
  LDI r14, 2
  ADD r12, r14
  MOV r1, r13
  LDI r14, 14
  ADD r1, r14
  LDI r14, 2
  LDI r8, 12
  RECTF r1, r12, r14, r8, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r12, 0x2400
  LOAD r13, r12
  LDI r14, 200
  CMP r13, r14
  BLT r2, gold_ok
  MOV r13, r14
gold_ok:
  LDI r7, 228
  LDI r1, 8
  LDI r14, 8
  LDI r22, 0xFFCC00
  RECTF r13, r7, r1, r14, r22

  ; Lives indicator (small red squares)
  LDI r12, 0x2401
  LOAD r15, r12
  LDI r7, 100
  LDI r1, 4
  LDI r14, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r15, lives_end
  LDI r8, 228
  RECTF r7, r8, r1, r14, r22
  LDI r8, 6
  ADD r7, r8
  LDI r8, 1
  SUB r15, r8
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r12, 0x2402
  LOAD r15, r12
  LDI r7, 4
  LDI r1, 4
  LDI r14, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r15, wave_end
  LDI r8, 248
  RECTF r7, r8, r1, r14, r22
  LDI r8, 6
  ADD r7, r8
  LDI r8, 1
  SUB r15, r8
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r13, 180
  LDI r7, 228
  LDI r1, 8
  LDI r14, 8
  LDI r22, 0x00CC00
  RECTF r13, r7, r1, r14, r22
  LDI r13, 200
  LDI r22, 0xCC0000
  RECTF r13, r7, r1, r14, r22
  LDI r13, 220
  LDI r22, 0x00CCCC
  RECTF r13, r7, r1, r14, r22

  RET
