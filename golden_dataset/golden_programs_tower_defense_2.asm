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

  LDI r6, 50
  LDI r11, 0x2400
  STORE r11, r6
  LDI r6, 20
  LDI r11, 0x2401
  STORE r11, r6
  LDI r6, 0
  LDI r11, 0x2402
  STORE r11, r6
  LDI r11, 0x2403
  STORE r11, r6
  LDI r11, 0x2405
  STORE r11, r6
  LDI r11, 0x2407
  STORE r11, r6
  LDI r11, 0x2408
  STORE r11, r6
  LDI r11, 0x2409
  STORE r11, r6
  LDI r11, 0x240A
  STORE r11, r6
  LDI r11, 0x2100
  STORE r11, r6
  LDI r11, 0x2200
  STORE r11, r6
  LDI r11, 0x2300
  STORE r11, r6

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r6, 10
  LDI r11, 0x2000
  STORE r11, r6

  ; wp0 (8, 40)
  LDI r6, 8
  LDI r11, 0x2001
  STORE r11, r6
  LDI r6, 40
  LDI r11, 0x2002
  STORE r11, r6
  ; wp1 (104, 40)
  LDI r6, 104
  LDI r11, 0x2003
  STORE r11, r6
  LDI r6, 40
  LDI r11, 0x2004
  STORE r11, r6
  ; wp2 (104, 104)
  LDI r6, 104
  LDI r11, 0x2005
  STORE r11, r6
  LDI r6, 104
  LDI r11, 0x2006
  STORE r11, r6
  ; wp3 (40, 104)
  LDI r6, 40
  LDI r11, 0x2007
  STORE r11, r6
  LDI r6, 104
  LDI r11, 0x2008
  STORE r11, r6
  ; wp4 (40, 168)
  LDI r6, 40
  LDI r11, 0x2009
  STORE r11, r6
  LDI r6, 168
  LDI r11, 0x200A
  STORE r11, r6
  ; wp5 (136, 168)
  LDI r6, 136
  LDI r11, 0x200B
  STORE r11, r6
  LDI r6, 168
  LDI r11, 0x200C
  STORE r11, r6
  ; wp6 (136, 72)
  LDI r6, 136
  LDI r11, 0x200D
  STORE r11, r6
  LDI r6, 72
  LDI r11, 0x200E
  STORE r11, r6
  ; wp7 (216, 72)
  LDI r6, 216
  LDI r11, 0x200F
  STORE r11, r6
  LDI r6, 72
  LDI r11, 0x2010
  STORE r11, r6
  ; wp8 (216, 168)
  LDI r6, 216
  LDI r11, 0x2011
  STORE r11, r6
  LDI r6, 168
  LDI r11, 0x2012
  STORE r11, r6
  ; wp9 (248, 168)
  LDI r6, 248
  LDI r11, 0x2013
  STORE r11, r6
  LDI r6, 168
  LDI r11, 0x2014
  STORE r11, r6

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r11, 0x2407
  LOAD r6, r11
  JNZ r6, game_over_screen

  ; clear screen dark green
  LDI r6, 0x1A3A1A
  FILL r6

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r6, 0x1A1A3A
  LDI r7, 0
  LDI r4, 224
  LDI r0, 256
  LDI r14, 32
  RECTF r7, r4, r0, r14, r6

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
  LDI r6, 0x550000
  FILL r6
  FRAME
  IKEY r6
  JZ r6, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r7, 0
  LDI r4, 32
  LDI r0, 112
  LDI r14, 16
  RECTF r7, r4, r0, r14, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r7, 96
  LDI r4, 32
  LDI r0, 16
  LDI r14, 80
  RECTF r7, r4, r0, r14, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r7, 32
  LDI r4, 96
  LDI r0, 80
  LDI r14, 16
  RECTF r7, r4, r0, r14, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r7, 32
  LDI r4, 96
  LDI r0, 16
  LDI r14, 80
  RECTF r7, r4, r0, r14, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r7, 32
  LDI r4, 160
  LDI r0, 112
  LDI r14, 16
  RECTF r7, r4, r0, r14, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r7, 128
  LDI r4, 64
  LDI r0, 16
  LDI r14, 112
  RECTF r7, r4, r0, r14, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r7, 128
  LDI r4, 64
  LDI r0, 96
  LDI r14, 16
  RECTF r7, r4, r0, r14, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r7, 208
  LDI r4, 64
  LDI r0, 16
  LDI r14, 112
  RECTF r7, r4, r0, r14, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r7, 208
  LDI r4, 160
  LDI r0, 48
  LDI r14, 16
  RECTF r7, r4, r0, r14, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r7, 0
  LDI r4, 32
  LDI r0, 4
  LDI r14, 16
  RECTF r7, r4, r0, r14, r22
  LDI r22, 0xCC0000
  LDI r7, 252
  LDI r4, 160
  RECTF r7, r4, r0, r14, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r15
  JZ r15, input_done

  LDI r14, 87
  CMP r15, r14
  JZ r9, input_up
  LDI r14, 119
  CMP r15, r14
  JZ r9, input_up
  LDI r14, 83
  CMP r15, r14
  JZ r9, input_down
  LDI r14, 115
  CMP r15, r14
  JZ r9, input_down
  LDI r14, 65
  CMP r15, r14
  JZ r9, input_left
  LDI r14, 97
  CMP r15, r14
  JZ r9, input_left
  LDI r14, 68
  CMP r15, r14
  JZ r9, input_right
  LDI r14, 100
  CMP r15, r14
  JZ r9, input_right
  LDI r14, 49
  CMP r15, r14
  JZ r9, input_sel1
  LDI r14, 50
  CMP r15, r14
  JZ r9, input_sel2
  LDI r14, 51
  CMP r15, r14
  JZ r9, input_sel3
  LDI r14, 32
  CMP r15, r14
  JZ r9, input_place
  LDI r14, 78
  CMP r15, r14
  JZ r9, input_newwave
  LDI r14, 110
  CMP r15, r14
  JZ r9, input_newwave
  LDI r14, 82
  CMP r15, r14
  JZ r9, do_restart
  LDI r14, 114
  CMP r15, r14
  JZ r9, do_restart
  JMP input_done

input_up:
  LDI r11, 0x2409
  LOAD r6, r11
  JZ r6, input_done
  LDI r14, 1
  SUB r6, r14
  STORE r11, r6
  JMP input_done

input_down:
  LDI r11, 0x2409
  LOAD r6, r11
  LDI r14, 13
  CMP r6, r14
  BGE r9, input_done
  LDI r14, 1
  ADD r6, r14
  STORE r11, r6
  JMP input_done

input_left:
  LDI r11, 0x2408
  LOAD r6, r11
  JZ r6, input_done
  LDI r14, 1
  SUB r6, r14
  STORE r11, r6
  JMP input_done

input_right:
  LDI r11, 0x2408
  LOAD r6, r11
  LDI r14, 15
  CMP r6, r14
  BGE r9, input_done
  LDI r14, 1
  ADD r6, r14
  STORE r11, r6
  JMP input_done

input_sel1:
  LDI r6, 1
  LDI r11, 0x240A
  STORE r11, r6
  JMP input_done

input_sel2:
  LDI r6, 2
  LDI r11, 0x240A
  STORE r11, r6
  JMP input_done

input_sel3:
  LDI r6, 3
  LDI r11, 0x240A
  STORE r11, r6
  JMP input_done

input_newwave:
  LDI r11, 0x2403
  LOAD r6, r11
  JNZ r6, input_done
  PUSH r31
  CALL start_wave
  POP r31
  JMP input_done

do_restart:
  ; POP the value game_loop pushed, then restart
  POP r31
  JMP restart

input_place:
  LDI r11, 0x240A
  LOAD r6, r11
  JZ r6, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r14, 2
  CMP r6, r14
  BGE r9, place_type2or3
  LDI r14, 10
  JMP place_check_gold
place_type2or3:
  LDI r14, 3
  CMP r6, r14
  JZ r9, place_type3
  LDI r14, 25
  JMP place_check_gold
place_type3:
  LDI r14, 15

place_check_gold:
  ; r14=cost, r6=type
  LDI r11, 0x2400
  LOAD r7, r11
  CMP r7, r14
  BLT r9, input_done

  LDI r11, 0x2200
  LOAD r4, r11
  LDI r15, 8
  CMP r4, r15
  BGE r9, input_done

  LDI r11, 0x2409
  LOAD r15, r11
  LDI r0, 14
  CMP r15, r0
  BGE r9, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r6, input_done

  ; deduct gold
  SUB r7, r14
  LDI r11, 0x2400
  STORE r11, r7

  ; slot addr = 0x2201 + count * 4
  LDI r11, 0x2200
  LOAD r4, r11
  LDI r15, 4
  MUL r4, r15
  LDI r0, 0x2201
  ADD r0, r4

  ; cell_x
  LDI r11, 0x2408
  LOAD r4, r11
  STORE r0, r4
  LDI r15, 1
  ADD r0, r15
  ; cell_y
  LDI r11, 0x2409
  LOAD r4, r11
  STORE r0, r4
  LDI r15, 1
  ADD r0, r15
  ; type
  STORE r0, r6
  LDI r15, 1
  ADD r0, r15
  ; cd_timer = 0
  LDI r4, 0
  STORE r0, r4

  ; increment tower count
  LDI r11, 0x2200
  LOAD r4, r11
  LDI r15, 1
  ADD r4, r15
  STORE r11, r4

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r6=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r11, 0x2408
  LOAD r12, r11
  LDI r11, 0x2409
  LOAD r10, r11
  LDI r11, 0x2200
  LOAD r3, r11
  LDI r4, 0x2201
  LDI r6, 0

ctc_loop:
  JZ r3, ctc_done
  LOAD r0, r4
  MOV r11, r4
  LDI r14, 1
  ADD r11, r14
  LOAD r14, r11
  CMP r0, r12
  JNZ r9, ctc_next
  CMP r14, r10
  JNZ r9, ctc_next
  LDI r6, 1
  JMP ctc_done
ctc_next:
  LDI r14, 4
  ADD r4, r14
  LDI r14, 1
  SUB r3, r14
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r11, 0x2402
  LOAD r6, r11
  LDI r14, 1
  ADD r6, r14
  STORE r11, r6
  ; enemies_per_wave = 3 + wave*2
  MOV r0, r6
  LDI r14, 2
  MUL r0, r14
  LDI r14, 3
  ADD r0, r14
  LDI r11, 0x2406
  STORE r11, r0
  LDI r6, 1
  LDI r11, 0x2403
  STORE r11, r6
  LDI r6, 0
  LDI r11, 0x2404
  STORE r11, r6
  LDI r11, 0x2405
  STORE r11, r6
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r11, 0x2403
  LOAD r6, r11
  JZ r6, spawn_done

  LDI r11, 0x2405
  LOAD r7, r11
  LDI r11, 0x2406
  LOAD r4, r11
  CMP r7, r4
  BGE r9, spawn_check_done

  LDI r11, 0x2404
  LOAD r6, r11
  JZ r6, do_spawn
  LDI r14, 1
  SUB r6, r14
  STORE r11, r6
  JMP spawn_done

do_spawn:
  LDI r4, 0x2101
  LDI r3, 16

find_slot:
  JZ r3, spawn_done
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LOAD r11, r11
  JNZ r11, find_next

  ; spawn at wp0 center (8, 40)
  LDI r0, 8
  STORE r4, r0
  MOV r11, r4
  LDI r14, 1
  ADD r11, r14
  LDI r0, 40
  STORE r11, r0
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  ; hp = 2 + wave
  LDI r0, 0x2402
  LOAD r0, r0
  LDI r14, 2
  ADD r0, r14
  STORE r11, r0
  MOV r11, r4
  LDI r14, 3
  ADD r11, r14
  LDI r0, 1
  STORE r11, r0

  ; increment spawned
  LDI r11, 0x2405
  LOAD r0, r11
  LDI r14, 1
  ADD r0, r14
  STORE r11, r0
  ; spawn_timer = 30
  LDI r0, 30
  LDI r11, 0x2404
  STORE r11, r0
  ; increment enemy_count
  LDI r11, 0x2100
  LOAD r0, r11
  LDI r14, 1
  ADD r0, r14
  STORE r11, r0

  JMP spawn_done

find_next:
  LDI r14, 4
  ADD r4, r14
  LDI r14, 1
  SUB r3, r14
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r4, 0x2101
  LDI r3, 16
  LDI r6, 0
chk_alive:
  JZ r3, chk_done
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LOAD r11, r11
  JZ r11, chk_next
  LDI r14, 1
  ADD r6, r14
chk_next:
  LDI r14, 4
  ADD r4, r14
  LDI r14, 1
  SUB r3, r14
  JMP chk_alive
chk_done:
  JNZ r6, spawn_done
  LDI r6, 0
  LDI r11, 0x2403
  STORE r11, r6

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r4, 0x2101
  LDI r3, 16

me_loop:
  JZ r3, me_done

  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LOAD r11, r11
  JZ r11, me_next

  MOV r11, r4
  LDI r14, 3
  ADD r11, r14
  LOAD r8, r11

  LDI r14, 10
  CMP r8, r14
  BGE r9, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r0, r8
  LDI r14, 2
  MUL r0, r14
  LDI r11, 0x2001
  ADD r11, r0
  LOAD r13, r11
  LDI r14, 1
  ADD r11, r14
  LOAD r1, r11

  LOAD r12, r4
  MOV r11, r4
  LDI r14, 1
  ADD r11, r14
  LOAD r10, r11

  ; dx
  MOV r0, r13
  SUB r0, r12
  JNZ r0, me_move_h

  ; dy
  MOV r0, r1
  SUB r0, r10
  JZ r0, me_reached

  MOV r11, r0
  LDI r14, 31
  SAR r11, r14
  JZ r11, me_down
  LDI r14, 1
  SUB r10, r14
  JMP me_store
me_down:
  LDI r14, 1
  ADD r10, r14
  JMP me_store

me_move_h:
  MOV r11, r0
  LDI r14, 31
  SAR r11, r14
  JZ r11, me_right
  LDI r14, 1
  SUB r12, r14
  JMP me_store
me_right:
  LDI r14, 1
  ADD r12, r14
  JMP me_store

me_reached:
  MOV r11, r4
  LDI r14, 3
  ADD r11, r14
  LOAD r8, r11
  LDI r14, 1
  ADD r8, r14
  STORE r11, r8
  JMP me_next

enemy_escaped:
  LDI r11, 0x2401
  LOAD r0, r11
  LDI r14, 1
  SUB r0, r14
  STORE r11, r0
  JZ r0, set_game_over
  ; kill enemy
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LDI r0, 0
  STORE r11, r0
  LDI r11, 0x2100
  LOAD r0, r11
  LDI r14, 1
  SUB r0, r14
  STORE r11, r0
  JMP me_next

set_game_over:
  LDI r0, 1
  LDI r11, 0x2407
  STORE r11, r0
  JMP me_next

me_store:
  STORE r4, r12
  MOV r11, r4
  LDI r14, 1
  ADD r11, r14
  STORE r11, r10

me_next:
  LDI r14, 4
  ADD r4, r14
  LDI r14, 1
  SUB r3, r14
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r4, 0x2201
  LDI r11, 0x2200
  LOAD r3, r11

ut_loop:
  JZ r3, ut_done

  ; decrement cd
  MOV r11, r4
  LDI r14, 3
  ADD r11, r14
  LOAD r11, r11
  JZ r11, ut_ready
  LDI r14, 1
  SUB r11, r14
  MOV r0, r4
  LDI r14, 3
  ADD r0, r14
  STORE r0, r11
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r0, r4
  LDI r14, 16
  MUL r0, r14
  LDI r14, 8
  ADD r0, r14
  MOV r11, r4
  LDI r14, 1
  ADD r11, r14
  LOAD r14, r11
  LDI r15, 16
  MUL r14, r15
  LDI r15, 8
  ADD r14, r15

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r11, r4
  LDI r15, 2
  ADD r11, r15
  LOAD r11, r11
  LDI r15, 2
  CMP r11, r15
  BGE r9, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r15, 3
  CMP r11, r15
  JZ r9, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r5, 0xFFFFFFFF
  LDI r12, 0
  LDI r13, 0x2101
  LDI r1, 16

ut_sl:
  JZ r1, ut_sd
  MOV r11, r13
  LDI r15, 2
  ADD r11, r15
  LOAD r11, r11
  JZ r11, ut_sn

  LOAD r6, r13
  MOV r11, r13
  LDI r15, 1
  ADD r11, r15
  LOAD r7, r11

  MOV r11, r6
  SUB r11, r0
  MOV r15, r11
  MUL r15, r15
  MOV r10, r7
  SUB r10, r14
  MOV r11, r10
  MUL r11, r11
  ADD r15, r11

  CMP r15, r20
  BGE r9, ut_sn
  CMP r15, r5
  BGE r9, ut_sn
  MOV r5, r15
  MOV r2, r13
  LDI r12, 1

ut_sn:
  LDI r15, 4
  ADD r13, r15
  LDI r15, 1
  SUB r1, r15
  JMP ut_sl

ut_sd:
  JZ r12, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r11, r4
  LDI r15, 2
  ADD r11, r15
  LOAD r11, r11
  LDI r15, 2
  CMP r11, r15
  BGE r9, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r15, 3
  CMP r11, r15
  JZ r9, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r11, r2
  LDI r15, 2
  ADD r11, r15
  LOAD r15, r11
  CMP r15, r21
  BLT r9, ut_kill
  SUB r15, r21
  STORE r11, r15
  JMP ut_cd

ut_kill:
  LDI r15, 0
  STORE r11, r15
  LDI r11, 0x2400
  LOAD r15, r11
  LDI r0, 5
  ADD r15, r0
  STORE r11, r15
  LDI r11, 0x2100
  LOAD r15, r11
  LDI r0, 1
  SUB r15, r0
  STORE r11, r15
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r11, r4
  LDI r15, 2
  ADD r11, r15
  LOAD r11, r11
  LDI r15, 2
  CMP r11, r15
  BGE r9, ut_c2or3
  LDI r15, 20
  JMP ut_scd
ut_c2or3:
  LDI r15, 3
  CMP r11, r15
  JZ r9, ut_c3
  LDI r15, 45
  JMP ut_scd
ut_c3:
  LDI r15, 30

ut_scd:
  MOV r11, r4
  LDI r0, 3
  ADD r11, r0
  STORE r11, r15

ut_next:
  LDI r14, 4
  ADD r4, r14
  LDI r14, 1
  SUB r3, r14
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r2=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r4, 0x2301
  LDI r3, 8
cs_loop:
  JZ r3, cs_done
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LOAD r11, r11
  JNZ r11, cs_next

  LOAD r11, r2
  STORE r4, r11
  MOV r0, r4
  LDI r14, 1
  ADD r0, r14
  MOV r11, r2
  LDI r14, 1
  ADD r11, r14
  LOAD r11, r11
  STORE r0, r11
  MOV r0, r4
  LDI r14, 2
  ADD r0, r14
  LDI r11, 5
  STORE r0, r11
  JMP cs_done

cs_next:
  LDI r14, 3
  ADD r4, r14
  LDI r14, 1
  SUB r3, r14
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r4=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r4, 0x2301
  LDI r3, 8

ds_loop:
  JZ r3, ds_done

  ; check timer (offset 2 from r4)
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LOAD r11, r11
  JZ r11, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r7, r4           ; r7 = ex
  LDI r14, 3
  SUB r7, r14            ; x = ex - 3
  MOV r11, r4
  LDI r14, 1
  ADD r11, r14
  LOAD r11, r11           ; r11 = ey (NOT r4)
  LDI r14, 3
  SUB r11, r14            ; y = ey - 3
  LDI r0, 6
  LDI r14, 6
  LDI r22, 0xFFFF00
  RECTF r7, r11, r0, r14, r22

  ; decrement timer
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LOAD r0, r11
  LDI r14, 1
  SUB r0, r14
  STORE r11, r0

  JMP ds_next

ds_skip:
ds_next:
  LDI r14, 3
  ADD r4, r14
  LDI r14, 1
  SUB r3, r14
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r4, 0x2101
  LDI r3, 16

de_loop:
  JZ r3, de_done

  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LOAD r11, r11
  JZ r11, de_next

  LOAD r7, r4
  LDI r14, 3
  SUB r7, r14
  MOV r11, r4
  LDI r14, 1
  ADD r11, r14
  LOAD r11, r11
  LDI r14, 3
  SUB r11, r14
  LDI r0, 6
  LDI r14, 6
  LDI r22, 0xFF4444
  RECTF r7, r11, r0, r14, r22

de_next:
  LDI r14, 4
  ADD r4, r14
  LDI r14, 1
  SUB r3, r14
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r4, 0x2201
  LDI r11, 0x2200
  LOAD r3, r11

dt_loop:
  JZ r3, dt_done

  LOAD r7, r4
  LDI r14, 16
  MUL r7, r14
  MOV r11, r4
  LDI r14, 1
  ADD r11, r14
  LOAD r15, r11
  LDI r14, 16
  MUL r15, r14
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LOAD r11, r11

  ; color: 1=green, 2=red, 3=cyan
  LDI r14, 2
  CMP r11, r14
  BGE r9, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r14, 3
  CMP r11, r14
  JZ r9, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r0, 16
  LDI r14, 16
  RECTF r7, r15, r0, r14, r22

dt_next:
  LDI r14, 4
  ADD r4, r14
  LDI r14, 1
  SUB r3, r14
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r11, 0x2408
  LOAD r7, r11
  LDI r14, 16
  MUL r7, r14
  LDI r11, 0x2409
  LOAD r4, r11
  LDI r14, 16
  MUL r4, r14

  ; color by placing_type
  LDI r11, 0x240A
  LOAD r11, r11
  JZ r11, cur_white
  LDI r14, 2
  CMP r11, r14
  BGE r9, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r14, 3
  CMP r11, r14
  JZ r9, cur_t3
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
  LDI r14, 2
  RECTF r7, r4, r0, r14, r22
  ; bottom edge (y+14)
  MOV r11, r4
  LDI r14, 14
  ADD r11, r14
  RECTF r7, r11, r0, r14, r22
  ; left edge (y+2, x, 2, 12)
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  LDI r0, 2
  LDI r14, 12
  RECTF r7, r11, r0, r14, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r11, r4
  LDI r14, 2
  ADD r11, r14
  MOV r0, r7
  LDI r14, 14
  ADD r0, r14
  LDI r14, 2
  LDI r15, 12
  RECTF r0, r11, r14, r15, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r11, 0x2400
  LOAD r7, r11
  LDI r14, 200
  CMP r7, r14
  BLT r9, gold_ok
  MOV r7, r14
gold_ok:
  LDI r4, 228
  LDI r0, 8
  LDI r14, 8
  LDI r22, 0xFFCC00
  RECTF r7, r4, r0, r14, r22

  ; Lives indicator (small red squares)
  LDI r11, 0x2401
  LOAD r3, r11
  LDI r4, 100
  LDI r0, 4
  LDI r14, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r3, lives_end
  LDI r15, 228
  RECTF r4, r15, r0, r14, r22
  LDI r15, 6
  ADD r4, r15
  LDI r15, 1
  SUB r3, r15
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r11, 0x2402
  LOAD r3, r11
  LDI r4, 4
  LDI r0, 4
  LDI r14, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r3, wave_end
  LDI r15, 248
  RECTF r4, r15, r0, r14, r22
  LDI r15, 6
  ADD r4, r15
  LDI r15, 1
  SUB r3, r15
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r7, 180
  LDI r4, 228
  LDI r0, 8
  LDI r14, 8
  LDI r22, 0x00CC00
  RECTF r7, r4, r0, r14, r22
  LDI r7, 200
  LDI r22, 0xCC0000
  RECTF r7, r4, r0, r14, r22
  LDI r7, 220
  LDI r22, 0x00CCCC
  RECTF r7, r4, r0, r14, r22

  RET
