; DESCRIPTION: Display a object using color red at the screen.

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

  LDI r2, 50
  LDI r7, 0x2400
  STORE r7, r2
  LDI r2, 20
  LDI r7, 0x2401
  STORE r7, r2
  LDI r2, 0
  LDI r7, 0x2402
  STORE r7, r2
  LDI r7, 0x2403
  STORE r7, r2
  LDI r7, 0x2405
  STORE r7, r2
  LDI r7, 0x2407
  STORE r7, r2
  LDI r7, 0x2408
  STORE r7, r2
  LDI r7, 0x2409
  STORE r7, r2
  LDI r7, 0x240A
  STORE r7, r2
  LDI r7, 0x2100
  STORE r7, r2
  LDI r7, 0x2200
  STORE r7, r2
  LDI r7, 0x2300
  STORE r7, r2

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r2, 10
  LDI r7, 0x2000
  STORE r7, r2

  ; wp0 (8, 40)
  LDI r2, 8
  LDI r7, 0x2001
  STORE r7, r2
  LDI r2, 40
  LDI r7, 0x2002
  STORE r7, r2
  ; wp1 (104, 40)
  LDI r2, 104
  LDI r7, 0x2003
  STORE r7, r2
  LDI r2, 40
  LDI r7, 0x2004
  STORE r7, r2
  ; wp2 (104, 104)
  LDI r2, 104
  LDI r7, 0x2005
  STORE r7, r2
  LDI r2, 104
  LDI r7, 0x2006
  STORE r7, r2
  ; wp3 (40, 104)
  LDI r2, 40
  LDI r7, 0x2007
  STORE r7, r2
  LDI r2, 104
  LDI r7, 0x2008
  STORE r7, r2
  ; wp4 (40, 168)
  LDI r2, 40
  LDI r7, 0x2009
  STORE r7, r2
  LDI r2, 168
  LDI r7, 0x200A
  STORE r7, r2
  ; wp5 (136, 168)
  LDI r2, 136
  LDI r7, 0x200B
  STORE r7, r2
  LDI r2, 168
  LDI r7, 0x200C
  STORE r7, r2
  ; wp6 (136, 72)
  LDI r2, 136
  LDI r7, 0x200D
  STORE r7, r2
  LDI r2, 72
  LDI r7, 0x200E
  STORE r7, r2
  ; wp7 (216, 72)
  LDI r2, 216
  LDI r7, 0x200F
  STORE r7, r2
  LDI r2, 72
  LDI r7, 0x2010
  STORE r7, r2
  ; wp8 (216, 168)
  LDI r2, 216
  LDI r7, 0x2011
  STORE r7, r2
  LDI r2, 168
  LDI r7, 0x2012
  STORE r7, r2
  ; wp9 (248, 168)
  LDI r2, 248
  LDI r7, 0x2013
  STORE r7, r2
  LDI r2, 168
  LDI r7, 0x2014
  STORE r7, r2

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r7, 0x2407
  LOAD r2, r7
  JNZ r2, game_over_screen

  ; clear screen dark green
  LDI r2, 0x1A3A1A
  FILL r2

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r2, 0x1A1A3A
  LDI r14, 0
  LDI r4, 224
  LDI r3, 256
  LDI r6, 32
  RECTF r14, r4, r3, r6, r2

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
  LDI r2, 0x550000
  FILL r2
  FRAME
  IKEY r2
  JZ r2, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r14, 0
  LDI r4, 32
  LDI r3, 112
  LDI r6, 16
  RECTF r14, r4, r3, r6, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r14, 96
  LDI r4, 32
  LDI r3, 16
  LDI r6, 80
  RECTF r14, r4, r3, r6, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r14, 32
  LDI r4, 96
  LDI r3, 80
  LDI r6, 16
  RECTF r14, r4, r3, r6, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r14, 32
  LDI r4, 96
  LDI r3, 16
  LDI r6, 80
  RECTF r14, r4, r3, r6, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r14, 32
  LDI r4, 160
  LDI r3, 112
  LDI r6, 16
  RECTF r14, r4, r3, r6, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r14, 128
  LDI r4, 64
  LDI r3, 16
  LDI r6, 112
  RECTF r14, r4, r3, r6, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r14, 128
  LDI r4, 64
  LDI r3, 96
  LDI r6, 16
  RECTF r14, r4, r3, r6, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r14, 208
  LDI r4, 64
  LDI r3, 16
  LDI r6, 112
  RECTF r14, r4, r3, r6, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r14, 208
  LDI r4, 160
  LDI r3, 48
  LDI r6, 16
  RECTF r14, r4, r3, r6, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r14, 0
  LDI r4, 32
  LDI r3, 4
  LDI r6, 16
  RECTF r14, r4, r3, r6, r22
  LDI r22, 0xCC0000
  LDI r14, 252
  LDI r4, 160
  RECTF r14, r4, r3, r6, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r13
  JZ r13, input_done

  LDI r6, 87
  CMP r13, r6
  JZ r1, input_up
  LDI r6, 119
  CMP r13, r6
  JZ r1, input_up
  LDI r6, 83
  CMP r13, r6
  JZ r1, input_down
  LDI r6, 115
  CMP r13, r6
  JZ r1, input_down
  LDI r6, 65
  CMP r13, r6
  JZ r1, input_left
  LDI r6, 97
  CMP r13, r6
  JZ r1, input_left
  LDI r6, 68
  CMP r13, r6
  JZ r1, input_right
  LDI r6, 100
  CMP r13, r6
  JZ r1, input_right
  LDI r6, 49
  CMP r13, r6
  JZ r1, input_sel1
  LDI r6, 50
  CMP r13, r6
  JZ r1, input_sel2
  LDI r6, 51
  CMP r13, r6
  JZ r1, input_sel3
  LDI r6, 32
  CMP r13, r6
  JZ r1, input_place
  LDI r6, 78
  CMP r13, r6
  JZ r1, input_newwave
  LDI r6, 110
  CMP r13, r6
  JZ r1, input_newwave
  LDI r6, 82
  CMP r13, r6
  JZ r1, do_restart
  LDI r6, 114
  CMP r13, r6
  JZ r1, do_restart
  JMP input_done

input_up:
  LDI r7, 0x2409
  LOAD r2, r7
  JZ r2, input_done
  LDI r6, 1
  SUB r2, r6
  STORE r7, r2
  JMP input_done

input_down:
  LDI r7, 0x2409
  LOAD r2, r7
  LDI r6, 13
  CMP r2, r6
  BGE r1, input_done
  LDI r6, 1
  ADD r2, r6
  STORE r7, r2
  JMP input_done

input_left:
  LDI r7, 0x2408
  LOAD r2, r7
  JZ r2, input_done
  LDI r6, 1
  SUB r2, r6
  STORE r7, r2
  JMP input_done

input_right:
  LDI r7, 0x2408
  LOAD r2, r7
  LDI r6, 15
  CMP r2, r6
  BGE r1, input_done
  LDI r6, 1
  ADD r2, r6
  STORE r7, r2
  JMP input_done

input_sel1:
  LDI r2, 1
  LDI r7, 0x240A
  STORE r7, r2
  JMP input_done

input_sel2:
  LDI r2, 2
  LDI r7, 0x240A
  STORE r7, r2
  JMP input_done

input_sel3:
  LDI r2, 3
  LDI r7, 0x240A
  STORE r7, r2
  JMP input_done

input_newwave:
  LDI r7, 0x2403
  LOAD r2, r7
  JNZ r2, input_done
  PUSH r31
  CALL start_wave
  POP r31
  JMP input_done

do_restart:
  ; POP the value game_loop pushed, then restart
  POP r31
  JMP restart

input_place:
  LDI r7, 0x240A
  LOAD r2, r7
  JZ r2, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r6, 2
  CMP r2, r6
  BGE r1, place_type2or3
  LDI r6, 10
  JMP place_check_gold
place_type2or3:
  LDI r6, 3
  CMP r2, r6
  JZ r1, place_type3
  LDI r6, 25
  JMP place_check_gold
place_type3:
  LDI r6, 15

place_check_gold:
  ; r6=cost, r2=type
  LDI r7, 0x2400
  LOAD r14, r7
  CMP r14, r6
  BLT r1, input_done

  LDI r7, 0x2200
  LOAD r4, r7
  LDI r13, 8
  CMP r4, r13
  BGE r1, input_done

  LDI r7, 0x2409
  LOAD r13, r7
  LDI r3, 14
  CMP r13, r3
  BGE r1, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r2, input_done

  ; deduct gold
  SUB r14, r6
  LDI r7, 0x2400
  STORE r7, r14

  ; slot addr = 0x2201 + count * 4
  LDI r7, 0x2200
  LOAD r4, r7
  LDI r13, 4
  MUL r4, r13
  LDI r3, 0x2201
  ADD r3, r4

  ; cell_x
  LDI r7, 0x2408
  LOAD r4, r7
  STORE r3, r4
  LDI r13, 1
  ADD r3, r13
  ; cell_y
  LDI r7, 0x2409
  LOAD r4, r7
  STORE r3, r4
  LDI r13, 1
  ADD r3, r13
  ; type
  STORE r3, r2
  LDI r13, 1
  ADD r3, r13
  ; cd_timer = 0
  LDI r4, 0
  STORE r3, r4

  ; increment tower count
  LDI r7, 0x2200
  LOAD r4, r7
  LDI r13, 1
  ADD r4, r13
  STORE r7, r4

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r2=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r7, 0x2408
  LOAD r15, r7
  LDI r7, 0x2409
  LOAD r5, r7
  LDI r7, 0x2200
  LOAD r0, r7
  LDI r4, 0x2201
  LDI r2, 0

ctc_loop:
  JZ r0, ctc_done
  LOAD r3, r4
  MOV r7, r4
  LDI r6, 1
  ADD r7, r6
  LOAD r6, r7
  CMP r3, r15
  JNZ r1, ctc_next
  CMP r6, r5
  JNZ r1, ctc_next
  LDI r2, 1
  JMP ctc_done
ctc_next:
  LDI r6, 4
  ADD r4, r6
  LDI r6, 1
  SUB r0, r6
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r7, 0x2402
  LOAD r2, r7
  LDI r6, 1
  ADD r2, r6
  STORE r7, r2
  ; enemies_per_wave = 3 + wave*2
  MOV r3, r2
  LDI r6, 2
  MUL r3, r6
  LDI r6, 3
  ADD r3, r6
  LDI r7, 0x2406
  STORE r7, r3
  LDI r2, 1
  LDI r7, 0x2403
  STORE r7, r2
  LDI r2, 0
  LDI r7, 0x2404
  STORE r7, r2
  LDI r7, 0x2405
  STORE r7, r2
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r7, 0x2403
  LOAD r2, r7
  JZ r2, spawn_done

  LDI r7, 0x2405
  LOAD r14, r7
  LDI r7, 0x2406
  LOAD r4, r7
  CMP r14, r4
  BGE r1, spawn_check_done

  LDI r7, 0x2404
  LOAD r2, r7
  JZ r2, do_spawn
  LDI r6, 1
  SUB r2, r6
  STORE r7, r2
  JMP spawn_done

do_spawn:
  LDI r4, 0x2101
  LDI r0, 16

find_slot:
  JZ r0, spawn_done
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LOAD r7, r7
  JNZ r7, find_next

  ; spawn at wp0 center (8, 40)
  LDI r3, 8
  STORE r4, r3
  MOV r7, r4
  LDI r6, 1
  ADD r7, r6
  LDI r3, 40
  STORE r7, r3
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  ; hp = 2 + wave
  LDI r3, 0x2402
  LOAD r3, r3
  LDI r6, 2
  ADD r3, r6
  STORE r7, r3
  MOV r7, r4
  LDI r6, 3
  ADD r7, r6
  LDI r3, 1
  STORE r7, r3

  ; increment spawned
  LDI r7, 0x2405
  LOAD r3, r7
  LDI r6, 1
  ADD r3, r6
  STORE r7, r3
  ; spawn_timer = 30
  LDI r3, 30
  LDI r7, 0x2404
  STORE r7, r3
  ; increment enemy_count
  LDI r7, 0x2100
  LOAD r3, r7
  LDI r6, 1
  ADD r3, r6
  STORE r7, r3

  JMP spawn_done

find_next:
  LDI r6, 4
  ADD r4, r6
  LDI r6, 1
  SUB r0, r6
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r4, 0x2101
  LDI r0, 16
  LDI r2, 0
chk_alive:
  JZ r0, chk_done
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LOAD r7, r7
  JZ r7, chk_next
  LDI r6, 1
  ADD r2, r6
chk_next:
  LDI r6, 4
  ADD r4, r6
  LDI r6, 1
  SUB r0, r6
  JMP chk_alive
chk_done:
  JNZ r2, spawn_done
  LDI r2, 0
  LDI r7, 0x2403
  STORE r7, r2

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r4, 0x2101
  LDI r0, 16

me_loop:
  JZ r0, me_done

  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LOAD r7, r7
  JZ r7, me_next

  MOV r7, r4
  LDI r6, 3
  ADD r7, r6
  LOAD r8, r7

  LDI r6, 10
  CMP r8, r6
  BGE r1, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r3, r8
  LDI r6, 2
  MUL r3, r6
  LDI r7, 0x2001
  ADD r7, r3
  LOAD r10, r7
  LDI r6, 1
  ADD r7, r6
  LOAD r11, r7

  LOAD r15, r4
  MOV r7, r4
  LDI r6, 1
  ADD r7, r6
  LOAD r5, r7

  ; dx
  MOV r3, r10
  SUB r3, r15
  JNZ r3, me_move_h

  ; dy
  MOV r3, r11
  SUB r3, r5
  JZ r3, me_reached

  MOV r7, r3
  LDI r6, 31
  SAR r7, r6
  JZ r7, me_down
  LDI r6, 1
  SUB r5, r6
  JMP me_store
me_down:
  LDI r6, 1
  ADD r5, r6
  JMP me_store

me_move_h:
  MOV r7, r3
  LDI r6, 31
  SAR r7, r6
  JZ r7, me_right
  LDI r6, 1
  SUB r15, r6
  JMP me_store
me_right:
  LDI r6, 1
  ADD r15, r6
  JMP me_store

me_reached:
  MOV r7, r4
  LDI r6, 3
  ADD r7, r6
  LOAD r8, r7
  LDI r6, 1
  ADD r8, r6
  STORE r7, r8
  JMP me_next

enemy_escaped:
  LDI r7, 0x2401
  LOAD r3, r7
  LDI r6, 1
  SUB r3, r6
  STORE r7, r3
  JZ r3, set_game_over
  ; kill enemy
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LDI r3, 0
  STORE r7, r3
  LDI r7, 0x2100
  LOAD r3, r7
  LDI r6, 1
  SUB r3, r6
  STORE r7, r3
  JMP me_next

set_game_over:
  LDI r3, 1
  LDI r7, 0x2407
  STORE r7, r3
  JMP me_next

me_store:
  STORE r4, r15
  MOV r7, r4
  LDI r6, 1
  ADD r7, r6
  STORE r7, r5

me_next:
  LDI r6, 4
  ADD r4, r6
  LDI r6, 1
  SUB r0, r6
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r4, 0x2201
  LDI r7, 0x2200
  LOAD r0, r7

ut_loop:
  JZ r0, ut_done

  ; decrement cd
  MOV r7, r4
  LDI r6, 3
  ADD r7, r6
  LOAD r7, r7
  JZ r7, ut_ready
  LDI r6, 1
  SUB r7, r6
  MOV r3, r4
  LDI r6, 3
  ADD r3, r6
  STORE r3, r7
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r3, r4
  LDI r6, 16
  MUL r3, r6
  LDI r6, 8
  ADD r3, r6
  MOV r7, r4
  LDI r6, 1
  ADD r7, r6
  LOAD r6, r7
  LDI r13, 16
  MUL r6, r13
  LDI r13, 8
  ADD r6, r13

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r7, r4
  LDI r13, 2
  ADD r7, r13
  LOAD r7, r7
  LDI r13, 2
  CMP r7, r13
  BGE r1, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r13, 3
  CMP r7, r13
  JZ r1, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r12, 0xFFFFFFFF
  LDI r15, 0
  LDI r10, 0x2101
  LDI r11, 16

ut_sl:
  JZ r11, ut_sd
  MOV r7, r10
  LDI r13, 2
  ADD r7, r13
  LOAD r7, r7
  JZ r7, ut_sn

  LOAD r2, r10
  MOV r7, r10
  LDI r13, 1
  ADD r7, r13
  LOAD r14, r7

  MOV r7, r2
  SUB r7, r3
  MOV r13, r7
  MUL r13, r13
  MOV r5, r14
  SUB r5, r6
  MOV r7, r5
  MUL r7, r7
  ADD r13, r7

  CMP r13, r20
  BGE r1, ut_sn
  CMP r13, r12
  BGE r1, ut_sn
  MOV r12, r13
  MOV r9, r10
  LDI r15, 1

ut_sn:
  LDI r13, 4
  ADD r10, r13
  LDI r13, 1
  SUB r11, r13
  JMP ut_sl

ut_sd:
  JZ r15, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r7, r4
  LDI r13, 2
  ADD r7, r13
  LOAD r7, r7
  LDI r13, 2
  CMP r7, r13
  BGE r1, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r13, 3
  CMP r7, r13
  JZ r1, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r7, r9
  LDI r13, 2
  ADD r7, r13
  LOAD r13, r7
  CMP r13, r21
  BLT r1, ut_kill
  SUB r13, r21
  STORE r7, r13
  JMP ut_cd

ut_kill:
  LDI r13, 0
  STORE r7, r13
  LDI r7, 0x2400
  LOAD r13, r7
  LDI r3, 5
  ADD r13, r3
  STORE r7, r13
  LDI r7, 0x2100
  LOAD r13, r7
  LDI r3, 1
  SUB r13, r3
  STORE r7, r13
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r7, r4
  LDI r13, 2
  ADD r7, r13
  LOAD r7, r7
  LDI r13, 2
  CMP r7, r13
  BGE r1, ut_c2or3
  LDI r13, 20
  JMP ut_scd
ut_c2or3:
  LDI r13, 3
  CMP r7, r13
  JZ r1, ut_c3
  LDI r13, 45
  JMP ut_scd
ut_c3:
  LDI r13, 30

ut_scd:
  MOV r7, r4
  LDI r3, 3
  ADD r7, r3
  STORE r7, r13

ut_next:
  LDI r6, 4
  ADD r4, r6
  LDI r6, 1
  SUB r0, r6
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r9=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r4, 0x2301
  LDI r0, 8
cs_loop:
  JZ r0, cs_done
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LOAD r7, r7
  JNZ r7, cs_next

  LOAD r7, r9
  STORE r4, r7
  MOV r3, r4
  LDI r6, 1
  ADD r3, r6
  MOV r7, r9
  LDI r6, 1
  ADD r7, r6
  LOAD r7, r7
  STORE r3, r7
  MOV r3, r4
  LDI r6, 2
  ADD r3, r6
  LDI r7, 5
  STORE r3, r7
  JMP cs_done

cs_next:
  LDI r6, 3
  ADD r4, r6
  LDI r6, 1
  SUB r0, r6
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r4=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r4, 0x2301
  LDI r0, 8

ds_loop:
  JZ r0, ds_done

  ; check timer (offset 2 from r4)
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LOAD r7, r7
  JZ r7, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r14, r4           ; r14 = ex
  LDI r6, 3
  SUB r14, r6            ; x = ex - 3
  MOV r7, r4
  LDI r6, 1
  ADD r7, r6
  LOAD r7, r7           ; r7 = ey (NOT r4)
  LDI r6, 3
  SUB r7, r6            ; y = ey - 3
  LDI r3, 6
  LDI r6, 6
  LDI r22, 0xFFFF00
  RECTF r14, r7, r3, r6, r22

  ; decrement timer
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LOAD r3, r7
  LDI r6, 1
  SUB r3, r6
  STORE r7, r3

  JMP ds_next

ds_skip:
ds_next:
  LDI r6, 3
  ADD r4, r6
  LDI r6, 1
  SUB r0, r6
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r4, 0x2101
  LDI r0, 16

de_loop:
  JZ r0, de_done

  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LOAD r7, r7
  JZ r7, de_next

  LOAD r14, r4
  LDI r6, 3
  SUB r14, r6
  MOV r7, r4
  LDI r6, 1
  ADD r7, r6
  LOAD r7, r7
  LDI r6, 3
  SUB r7, r6
  LDI r3, 6
  LDI r6, 6
  LDI r22, 0xFF4444
  RECTF r14, r7, r3, r6, r22

de_next:
  LDI r6, 4
  ADD r4, r6
  LDI r6, 1
  SUB r0, r6
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r4, 0x2201
  LDI r7, 0x2200
  LOAD r0, r7

dt_loop:
  JZ r0, dt_done

  LOAD r14, r4
  LDI r6, 16
  MUL r14, r6
  MOV r7, r4
  LDI r6, 1
  ADD r7, r6
  LOAD r13, r7
  LDI r6, 16
  MUL r13, r6
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LOAD r7, r7

  ; color: 1=green, 2=red, 3=cyan
  LDI r6, 2
  CMP r7, r6
  BGE r1, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r6, 3
  CMP r7, r6
  JZ r1, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r3, 16
  LDI r6, 16
  RECTF r14, r13, r3, r6, r22

dt_next:
  LDI r6, 4
  ADD r4, r6
  LDI r6, 1
  SUB r0, r6
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r7, 0x2408
  LOAD r14, r7
  LDI r6, 16
  MUL r14, r6
  LDI r7, 0x2409
  LOAD r4, r7
  LDI r6, 16
  MUL r4, r6

  ; color by placing_type
  LDI r7, 0x240A
  LOAD r7, r7
  JZ r7, cur_white
  LDI r6, 2
  CMP r7, r6
  BGE r1, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r6, 3
  CMP r7, r6
  JZ r1, cur_t3
  LDI r22, 0xFF0000
  JMP cur_draw
cur_t3:
  LDI r22, 0x00FFFF
  JMP cur_draw
cur_white:
  LDI r22, 0xFFFFFF

cur_draw:
  ; top edge (y, x, 16, 2)
  LDI r3, 16
  LDI r6, 2
  RECTF r14, r4, r3, r6, r22
  ; bottom edge (y+14)
  MOV r7, r4
  LDI r6, 14
  ADD r7, r6
  RECTF r14, r7, r3, r6, r22
  ; left edge (y+2, x, 2, 12)
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  LDI r3, 2
  LDI r6, 12
  RECTF r14, r7, r3, r6, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r7, r4
  LDI r6, 2
  ADD r7, r6
  MOV r3, r14
  LDI r6, 14
  ADD r3, r6
  LDI r6, 2
  LDI r13, 12
  RECTF r3, r7, r6, r13, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r7, 0x2400
  LOAD r14, r7
  LDI r6, 200
  CMP r14, r6
  BLT r1, gold_ok
  MOV r14, r6
gold_ok:
  LDI r4, 228
  LDI r3, 8
  LDI r6, 8
  LDI r22, 0xFFCC00
  RECTF r14, r4, r3, r6, r22

  ; Lives indicator (small red squares)
  LDI r7, 0x2401
  LOAD r0, r7
  LDI r4, 100
  LDI r3, 4
  LDI r6, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r0, lives_end
  LDI r13, 228
  RECTF r4, r13, r3, r6, r22
  LDI r13, 6
  ADD r4, r13
  LDI r13, 1
  SUB r0, r13
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r7, 0x2402
  LOAD r0, r7
  LDI r4, 4
  LDI r3, 4
  LDI r6, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r0, wave_end
  LDI r13, 248
  RECTF r4, r13, r3, r6, r22
  LDI r13, 6
  ADD r4, r13
  LDI r13, 1
  SUB r0, r13
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r14, 180
  LDI r4, 228
  LDI r3, 8
  LDI r6, 8
  LDI r22, 0x00CC00
  RECTF r14, r4, r3, r6, r22
  LDI r14, 200
  LDI r22, 0xCC0000
  RECTF r14, r4, r3, r6, r22
  LDI r14, 220
  LDI r22, 0x00CCCC
  RECTF r14, r4, r3, r6, r22

  RET
