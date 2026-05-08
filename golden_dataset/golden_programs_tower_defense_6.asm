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

  LDI r13, 50
  LDI r7, 0x2400
  STORE r7, r13
  LDI r13, 20
  LDI r7, 0x2401
  STORE r7, r13
  LDI r13, 0
  LDI r7, 0x2402
  STORE r7, r13
  LDI r7, 0x2403
  STORE r7, r13
  LDI r7, 0x2405
  STORE r7, r13
  LDI r7, 0x2407
  STORE r7, r13
  LDI r7, 0x2408
  STORE r7, r13
  LDI r7, 0x2409
  STORE r7, r13
  LDI r7, 0x240A
  STORE r7, r13
  LDI r7, 0x2100
  STORE r7, r13
  LDI r7, 0x2200
  STORE r7, r13
  LDI r7, 0x2300
  STORE r7, r13

  ; --- waypoints (pixel centers) ---
  ; Path through cells: (0,2)->(6,2)->(6,6)->(2,6)->(2,10)
  ;   ->(8,10)->(8,4)->(13,4)->(13,10)->(15,10)
  LDI r13, 10
  LDI r7, 0x2000
  STORE r7, r13

  ; wp0 (8, 40)
  LDI r13, 8
  LDI r7, 0x2001
  STORE r7, r13
  LDI r13, 40
  LDI r7, 0x2002
  STORE r7, r13
  ; wp1 (104, 40)
  LDI r13, 104
  LDI r7, 0x2003
  STORE r7, r13
  LDI r13, 40
  LDI r7, 0x2004
  STORE r7, r13
  ; wp2 (104, 104)
  LDI r13, 104
  LDI r7, 0x2005
  STORE r7, r13
  LDI r13, 104
  LDI r7, 0x2006
  STORE r7, r13
  ; wp3 (40, 104)
  LDI r13, 40
  LDI r7, 0x2007
  STORE r7, r13
  LDI r13, 104
  LDI r7, 0x2008
  STORE r7, r13
  ; wp4 (40, 168)
  LDI r13, 40
  LDI r7, 0x2009
  STORE r7, r13
  LDI r13, 168
  LDI r7, 0x200A
  STORE r7, r13
  ; wp5 (136, 168)
  LDI r13, 136
  LDI r7, 0x200B
  STORE r7, r13
  LDI r13, 168
  LDI r7, 0x200C
  STORE r7, r13
  ; wp6 (136, 72)
  LDI r13, 136
  LDI r7, 0x200D
  STORE r7, r13
  LDI r13, 72
  LDI r7, 0x200E
  STORE r7, r13
  ; wp7 (216, 72)
  LDI r13, 216
  LDI r7, 0x200F
  STORE r7, r13
  LDI r13, 72
  LDI r7, 0x2010
  STORE r7, r13
  ; wp8 (216, 168)
  LDI r13, 216
  LDI r7, 0x2011
  STORE r7, r13
  LDI r13, 168
  LDI r7, 0x2012
  STORE r7, r13
  ; wp9 (248, 168)
  LDI r13, 248
  LDI r7, 0x2013
  STORE r7, r13
  LDI r13, 168
  LDI r7, 0x2014
  STORE r7, r13

; ═══════════════════════════════════════════════════════════════
; MAIN GAME LOOP
; ═══════════════════════════════════════════════════════════════
game_loop:
  LDI r7, 0x2407
  LOAD r13, r7
  JNZ r13, game_over_screen

  ; clear screen dark green
  LDI r13, 0x1A3A1A
  FILL r13

  PUSH r31
  CALL draw_path
  POP r31

  ; UI background bar
  LDI r13, 0x1A1A3A
  LDI r6, 0
  LDI r8, 224
  LDI r11, 256
  LDI r12, 32
  RECTF r6, r8, r11, r12, r13

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
  LDI r13, 0x550000
  FILL r13
  FRAME
  IKEY r13
  JZ r13, game_over_screen
  JMP restart

; ═══════════════════════════════════════════════════════════════
; draw_path -- 9 brown RECTF segments + entry/exit markers
; ═══════════════════════════════════════════════════════════════
draw_path:
  LDI r22, 0x8B6914

  ; seg0: (0,2)->(6,2) horizontal
  LDI r6, 0
  LDI r8, 32
  LDI r11, 112
  LDI r12, 16
  RECTF r6, r8, r11, r12, r22

  ; seg1: (6,2)->(6,6) vertical
  LDI r6, 96
  LDI r8, 32
  LDI r11, 16
  LDI r12, 80
  RECTF r6, r8, r11, r12, r22

  ; seg2: (6,6)->(2,6) horizontal
  LDI r6, 32
  LDI r8, 96
  LDI r11, 80
  LDI r12, 16
  RECTF r6, r8, r11, r12, r22

  ; seg3: (2,6)->(2,10) vertical
  LDI r6, 32
  LDI r8, 96
  LDI r11, 16
  LDI r12, 80
  RECTF r6, r8, r11, r12, r22

  ; seg4: (2,10)->(8,10) horizontal
  LDI r6, 32
  LDI r8, 160
  LDI r11, 112
  LDI r12, 16
  RECTF r6, r8, r11, r12, r22

  ; seg5: (8,10)->(8,4) vertical
  LDI r6, 128
  LDI r8, 64
  LDI r11, 16
  LDI r12, 112
  RECTF r6, r8, r11, r12, r22

  ; seg6: (8,4)->(13,4) horizontal
  LDI r6, 128
  LDI r8, 64
  LDI r11, 96
  LDI r12, 16
  RECTF r6, r8, r11, r12, r22

  ; seg7: (13,4)->(13,10) vertical
  LDI r6, 208
  LDI r8, 64
  LDI r11, 16
  LDI r12, 112
  RECTF r6, r8, r11, r12, r22

  ; seg8: (13,10)->(15,10) horizontal
  LDI r6, 208
  LDI r8, 160
  LDI r11, 48
  LDI r12, 16
  RECTF r6, r8, r11, r12, r22

  ; entry marker green, exit marker red
  LDI r22, 0x00CC00
  LDI r6, 0
  LDI r8, 32
  LDI r11, 4
  LDI r12, 16
  RECTF r6, r8, r11, r12, r22
  LDI r22, 0xCC0000
  LDI r6, 252
  LDI r8, 160
  RECTF r6, r8, r11, r12, r22

  RET

; ═══════════════════════════════════════════════════════════════
; handle_input -- WASD, 1/2/3, Space, N, R
; ═══════════════════════════════════════════════════════════════
handle_input:
  IKEY r2
  JZ r2, input_done

  LDI r12, 87
  CMP r2, r12
  JZ r15, input_up
  LDI r12, 119
  CMP r2, r12
  JZ r15, input_up
  LDI r12, 83
  CMP r2, r12
  JZ r15, input_down
  LDI r12, 115
  CMP r2, r12
  JZ r15, input_down
  LDI r12, 65
  CMP r2, r12
  JZ r15, input_left
  LDI r12, 97
  CMP r2, r12
  JZ r15, input_left
  LDI r12, 68
  CMP r2, r12
  JZ r15, input_right
  LDI r12, 100
  CMP r2, r12
  JZ r15, input_right
  LDI r12, 49
  CMP r2, r12
  JZ r15, input_sel1
  LDI r12, 50
  CMP r2, r12
  JZ r15, input_sel2
  LDI r12, 51
  CMP r2, r12
  JZ r15, input_sel3
  LDI r12, 32
  CMP r2, r12
  JZ r15, input_place
  LDI r12, 78
  CMP r2, r12
  JZ r15, input_newwave
  LDI r12, 110
  CMP r2, r12
  JZ r15, input_newwave
  LDI r12, 82
  CMP r2, r12
  JZ r15, do_restart
  LDI r12, 114
  CMP r2, r12
  JZ r15, do_restart
  JMP input_done

input_up:
  LDI r7, 0x2409
  LOAD r13, r7
  JZ r13, input_done
  LDI r12, 1
  SUB r13, r12
  STORE r7, r13
  JMP input_done

input_down:
  LDI r7, 0x2409
  LOAD r13, r7
  LDI r12, 13
  CMP r13, r12
  BGE r15, input_done
  LDI r12, 1
  ADD r13, r12
  STORE r7, r13
  JMP input_done

input_left:
  LDI r7, 0x2408
  LOAD r13, r7
  JZ r13, input_done
  LDI r12, 1
  SUB r13, r12
  STORE r7, r13
  JMP input_done

input_right:
  LDI r7, 0x2408
  LOAD r13, r7
  LDI r12, 15
  CMP r13, r12
  BGE r15, input_done
  LDI r12, 1
  ADD r13, r12
  STORE r7, r13
  JMP input_done

input_sel1:
  LDI r13, 1
  LDI r7, 0x240A
  STORE r7, r13
  JMP input_done

input_sel2:
  LDI r13, 2
  LDI r7, 0x240A
  STORE r7, r13
  JMP input_done

input_sel3:
  LDI r13, 3
  LDI r7, 0x240A
  STORE r7, r13
  JMP input_done

input_newwave:
  LDI r7, 0x2403
  LOAD r13, r7
  JNZ r13, input_done
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
  LOAD r13, r7
  JZ r13, input_done

  ; cost by type: 1=10, 2=25, 3=15
  LDI r12, 2
  CMP r13, r12
  BGE r15, place_type2or3
  LDI r12, 10
  JMP place_check_gold
place_type2or3:
  LDI r12, 3
  CMP r13, r12
  JZ r15, place_type3
  LDI r12, 25
  JMP place_check_gold
place_type3:
  LDI r12, 15

place_check_gold:
  ; r12=cost, r13=type
  LDI r7, 0x2400
  LOAD r6, r7
  CMP r6, r12
  BLT r15, input_done

  LDI r7, 0x2200
  LOAD r8, r7
  LDI r2, 8
  CMP r8, r2
  BGE r15, input_done

  LDI r7, 0x2409
  LOAD r2, r7
  LDI r11, 14
  CMP r2, r11
  BGE r15, input_done

  PUSH r31
  CALL check_tower_collision
  POP r31
  JNZ r13, input_done

  ; deduct gold
  SUB r6, r12
  LDI r7, 0x2400
  STORE r7, r6

  ; slot addr = 0x2201 + count * 4
  LDI r7, 0x2200
  LOAD r8, r7
  LDI r2, 4
  MUL r8, r2
  LDI r11, 0x2201
  ADD r11, r8

  ; cell_x
  LDI r7, 0x2408
  LOAD r8, r7
  STORE r11, r8
  LDI r2, 1
  ADD r11, r2
  ; cell_y
  LDI r7, 0x2409
  LOAD r8, r7
  STORE r11, r8
  LDI r2, 1
  ADD r11, r2
  ; type
  STORE r11, r13
  LDI r2, 1
  ADD r11, r2
  ; cd_timer = 0
  LDI r8, 0
  STORE r11, r8

  ; increment tower count
  LDI r7, 0x2200
  LOAD r8, r7
  LDI r2, 1
  ADD r8, r2
  STORE r7, r8

input_done:
  RET

; ═══════════════════════════════════════════════════════════════
; check_tower_collision -- r13=1 if cursor on existing tower
; ═══════════════════════════════════════════════════════════════
check_tower_collision:
  LDI r7, 0x2408
  LOAD r0, r7
  LDI r7, 0x2409
  LOAD r14, r7
  LDI r7, 0x2200
  LOAD r3, r7
  LDI r8, 0x2201
  LDI r13, 0

ctc_loop:
  JZ r3, ctc_done
  LOAD r11, r8
  MOV r7, r8
  LDI r12, 1
  ADD r7, r12
  LOAD r12, r7
  CMP r11, r0
  JNZ r15, ctc_next
  CMP r12, r14
  JNZ r15, ctc_next
  LDI r13, 1
  JMP ctc_done
ctc_next:
  LDI r12, 4
  ADD r8, r12
  LDI r12, 1
  SUB r3, r12
  JMP ctc_loop
ctc_done:
  RET

; ═══════════════════════════════════════════════════════════════
; start_wave
; ═══════════════════════════════════════════════════════════════
start_wave:
  LDI r7, 0x2402
  LOAD r13, r7
  LDI r12, 1
  ADD r13, r12
  STORE r7, r13
  ; enemies_per_wave = 3 + wave*2
  MOV r11, r13
  LDI r12, 2
  MUL r11, r12
  LDI r12, 3
  ADD r11, r12
  LDI r7, 0x2406
  STORE r7, r11
  LDI r13, 1
  LDI r7, 0x2403
  STORE r7, r13
  LDI r13, 0
  LDI r7, 0x2404
  STORE r7, r13
  LDI r7, 0x2405
  STORE r7, r13
  RET

; ═══════════════════════════════════════════════════════════════
; spawn_logic
; ═══════════════════════════════════════════════════════════════
spawn_logic:
  LDI r7, 0x2403
  LOAD r13, r7
  JZ r13, spawn_done

  LDI r7, 0x2405
  LOAD r6, r7
  LDI r7, 0x2406
  LOAD r8, r7
  CMP r6, r8
  BGE r15, spawn_check_done

  LDI r7, 0x2404
  LOAD r13, r7
  JZ r13, do_spawn
  LDI r12, 1
  SUB r13, r12
  STORE r7, r13
  JMP spawn_done

do_spawn:
  LDI r8, 0x2101
  LDI r3, 16

find_slot:
  JZ r3, spawn_done
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LOAD r7, r7
  JNZ r7, find_next

  ; spawn at wp0 center (8, 40)
  LDI r11, 8
  STORE r8, r11
  MOV r7, r8
  LDI r12, 1
  ADD r7, r12
  LDI r11, 40
  STORE r7, r11
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  ; hp = 2 + wave
  LDI r11, 0x2402
  LOAD r11, r11
  LDI r12, 2
  ADD r11, r12
  STORE r7, r11
  MOV r7, r8
  LDI r12, 3
  ADD r7, r12
  LDI r11, 1
  STORE r7, r11

  ; increment spawned
  LDI r7, 0x2405
  LOAD r11, r7
  LDI r12, 1
  ADD r11, r12
  STORE r7, r11
  ; spawn_timer = 30
  LDI r11, 30
  LDI r7, 0x2404
  STORE r7, r11
  ; increment enemy_count
  LDI r7, 0x2100
  LOAD r11, r7
  LDI r12, 1
  ADD r11, r12
  STORE r7, r11

  JMP spawn_done

find_next:
  LDI r12, 4
  ADD r8, r12
  LDI r12, 1
  SUB r3, r12
  JMP find_slot

spawn_check_done:
  ; all spawned, check if any alive
  LDI r8, 0x2101
  LDI r3, 16
  LDI r13, 0
chk_alive:
  JZ r3, chk_done
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LOAD r7, r7
  JZ r7, chk_next
  LDI r12, 1
  ADD r13, r12
chk_next:
  LDI r12, 4
  ADD r8, r12
  LDI r12, 1
  SUB r3, r12
  JMP chk_alive
chk_done:
  JNZ r13, spawn_done
  LDI r13, 0
  LDI r7, 0x2403
  STORE r7, r13

spawn_done:
  RET

; ═══════════════════════════════════════════════════════════════
; move_all_enemies
; ═══════════════════════════════════════════════════════════════
move_all_enemies:
  LDI r8, 0x2101
  LDI r3, 16

me_loop:
  JZ r3, me_done

  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LOAD r7, r7
  JZ r7, me_next

  MOV r7, r8
  LDI r12, 3
  ADD r7, r12
  LOAD r4, r7

  LDI r12, 10
  CMP r4, r12
  BGE r15, enemy_escaped

  ; target = waypoint[wp_idx]
  MOV r11, r4
  LDI r12, 2
  MUL r11, r12
  LDI r7, 0x2001
  ADD r7, r11
  LOAD r9, r7
  LDI r12, 1
  ADD r7, r12
  LOAD r1, r7

  LOAD r0, r8
  MOV r7, r8
  LDI r12, 1
  ADD r7, r12
  LOAD r14, r7

  ; dx
  MOV r11, r9
  SUB r11, r0
  JNZ r11, me_move_h

  ; dy
  MOV r11, r1
  SUB r11, r14
  JZ r11, me_reached

  MOV r7, r11
  LDI r12, 31
  SAR r7, r12
  JZ r7, me_down
  LDI r12, 1
  SUB r14, r12
  JMP me_store
me_down:
  LDI r12, 1
  ADD r14, r12
  JMP me_store

me_move_h:
  MOV r7, r11
  LDI r12, 31
  SAR r7, r12
  JZ r7, me_right
  LDI r12, 1
  SUB r0, r12
  JMP me_store
me_right:
  LDI r12, 1
  ADD r0, r12
  JMP me_store

me_reached:
  MOV r7, r8
  LDI r12, 3
  ADD r7, r12
  LOAD r4, r7
  LDI r12, 1
  ADD r4, r12
  STORE r7, r4
  JMP me_next

enemy_escaped:
  LDI r7, 0x2401
  LOAD r11, r7
  LDI r12, 1
  SUB r11, r12
  STORE r7, r11
  JZ r11, set_game_over
  ; kill enemy
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LDI r11, 0
  STORE r7, r11
  LDI r7, 0x2100
  LOAD r11, r7
  LDI r12, 1
  SUB r11, r12
  STORE r7, r11
  JMP me_next

set_game_over:
  LDI r11, 1
  LDI r7, 0x2407
  STORE r7, r11
  JMP me_next

me_store:
  STORE r8, r0
  MOV r7, r8
  LDI r12, 1
  ADD r7, r12
  STORE r7, r14

me_next:
  LDI r12, 4
  ADD r8, r12
  LDI r12, 1
  SUB r3, r12
  JMP me_loop
me_done:
  RET

; ═══════════════════════════════════════════════════════════════
; update_all_towers -- target, damage, cooldown
; ═══════════════════════════════════════════════════════════════
update_all_towers:
  LDI r8, 0x2201
  LDI r7, 0x2200
  LOAD r3, r7

ut_loop:
  JZ r3, ut_done

  ; decrement cd
  MOV r7, r8
  LDI r12, 3
  ADD r7, r12
  LOAD r7, r7
  JZ r7, ut_ready
  LDI r12, 1
  SUB r7, r12
  MOV r11, r8
  LDI r12, 3
  ADD r11, r12
  STORE r11, r7
  JMP ut_next

ut_ready:
  ; tower pixel center
  LOAD r11, r8
  LDI r12, 16
  MUL r11, r12
  LDI r12, 8
  ADD r11, r12
  MOV r7, r8
  LDI r12, 1
  ADD r7, r12
  LOAD r12, r7
  LDI r2, 16
  MUL r12, r2
  LDI r2, 8
  ADD r12, r2

  ; range_sq by type: 1=2304, 2=1600, 3=3136
  MOV r7, r8
  LDI r2, 2
  ADD r7, r2
  LOAD r7, r7
  LDI r2, 2
  CMP r7, r2
  BGE r15, ut_r2or3
  LDI r20, 2304
  JMP ut_search
ut_r2or3:
  LDI r2, 3
  CMP r7, r2
  JZ r15, ut_r3
  LDI r20, 1600
  JMP ut_search
ut_r3:
  LDI r20, 3136

ut_search:
  LDI r10, 0xFFFFFFFF
  LDI r0, 0
  LDI r9, 0x2101
  LDI r1, 16

ut_sl:
  JZ r1, ut_sd
  MOV r7, r9
  LDI r2, 2
  ADD r7, r2
  LOAD r7, r7
  JZ r7, ut_sn

  LOAD r13, r9
  MOV r7, r9
  LDI r2, 1
  ADD r7, r2
  LOAD r6, r7

  MOV r7, r13
  SUB r7, r11
  MOV r2, r7
  MUL r2, r2
  MOV r14, r6
  SUB r14, r12
  MOV r7, r14
  MUL r7, r7
  ADD r2, r7

  CMP r2, r20
  BGE r15, ut_sn
  CMP r2, r10
  BGE r15, ut_sn
  MOV r10, r2
  MOV r5, r9
  LDI r0, 1

ut_sn:
  LDI r2, 4
  ADD r9, r2
  LDI r2, 1
  SUB r1, r2
  JMP ut_sl

ut_sd:
  JZ r0, ut_next

  ; damage by type: 1=1, 2=3, 3=1
  MOV r7, r8
  LDI r2, 2
  ADD r7, r2
  LOAD r7, r7
  LDI r2, 2
  CMP r7, r2
  BGE r15, ut_d2or3
  LDI r21, 1
  JMP ut_dmg
ut_d2or3:
  LDI r2, 3
  CMP r7, r2
  JZ r15, ut_d3
  LDI r21, 3
  JMP ut_dmg
ut_d3:
  LDI r21, 1

ut_dmg:
  MOV r7, r5
  LDI r2, 2
  ADD r7, r2
  LOAD r2, r7
  CMP r2, r21
  BLT r15, ut_kill
  SUB r2, r21
  STORE r7, r2
  JMP ut_cd

ut_kill:
  LDI r2, 0
  STORE r7, r2
  LDI r7, 0x2400
  LOAD r2, r7
  LDI r11, 5
  ADD r2, r11
  STORE r7, r2
  LDI r7, 0x2100
  LOAD r2, r7
  LDI r11, 1
  SUB r2, r11
  STORE r7, r2
  PUSH r31
  CALL create_shot
  POP r31

ut_cd:
  ; cooldown: type 1=20, 2=45, 3=30
  MOV r7, r8
  LDI r2, 2
  ADD r7, r2
  LOAD r7, r7
  LDI r2, 2
  CMP r7, r2
  BGE r15, ut_c2or3
  LDI r2, 20
  JMP ut_scd
ut_c2or3:
  LDI r2, 3
  CMP r7, r2
  JZ r15, ut_c3
  LDI r2, 45
  JMP ut_scd
ut_c3:
  LDI r2, 30

ut_scd:
  MOV r7, r8
  LDI r11, 3
  ADD r7, r11
  STORE r7, r2

ut_next:
  LDI r12, 4
  ADD r8, r12
  LDI r12, 1
  SUB r3, r12
  JMP ut_loop
ut_done:
  RET

; ═══════════════════════════════════════════════════════════════
; create_shot -- visual flash at enemy position (r5=enemy ptr)
; ═══════════════════════════════════════════════════════════════
create_shot:
  LDI r8, 0x2301
  LDI r3, 8
cs_loop:
  JZ r3, cs_done
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LOAD r7, r7
  JNZ r7, cs_next

  LOAD r7, r5
  STORE r8, r7
  MOV r11, r8
  LDI r12, 1
  ADD r11, r12
  MOV r7, r5
  LDI r12, 1
  ADD r7, r12
  LOAD r7, r7
  STORE r11, r7
  MOV r11, r8
  LDI r12, 2
  ADD r11, r12
  LDI r7, 5
  STORE r11, r7
  JMP cs_done

cs_next:
  LDI r12, 3
  ADD r8, r12
  LDI r12, 1
  SUB r3, r12
  JMP cs_loop
cs_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_shots -- yellow flash squares, r8=loop ptr preserved
; ═══════════════════════════════════════════════════════════════
draw_shots:
  LDI r8, 0x2301
  LDI r3, 8

ds_loop:
  JZ r3, ds_done

  ; check timer (offset 2 from r8)
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LOAD r7, r7
  JZ r7, ds_skip

  ; ex at offset 0, ey at offset 1
  LOAD r6, r8           ; r6 = ex
  LDI r12, 3
  SUB r6, r12            ; x = ex - 3
  MOV r7, r8
  LDI r12, 1
  ADD r7, r12
  LOAD r7, r7           ; r7 = ey (NOT r8)
  LDI r12, 3
  SUB r7, r12            ; y = ey - 3
  LDI r11, 6
  LDI r12, 6
  LDI r22, 0xFFFF00
  RECTF r6, r7, r11, r12, r22

  ; decrement timer
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LOAD r11, r7
  LDI r12, 1
  SUB r11, r12
  STORE r7, r11

  JMP ds_next

ds_skip:
ds_next:
  LDI r12, 3
  ADD r8, r12
  LDI r12, 1
  SUB r3, r12
  JMP ds_loop

ds_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_enemies -- red squares for alive enemies
; ═══════════════════════════════════════════════════════════════
draw_enemies:
  LDI r8, 0x2101
  LDI r3, 16

de_loop:
  JZ r3, de_done

  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LOAD r7, r7
  JZ r7, de_next

  LOAD r6, r8
  LDI r12, 3
  SUB r6, r12
  MOV r7, r8
  LDI r12, 1
  ADD r7, r12
  LOAD r7, r7
  LDI r12, 3
  SUB r7, r12
  LDI r11, 6
  LDI r12, 6
  LDI r22, 0xFF4444
  RECTF r6, r7, r11, r12, r22

de_next:
  LDI r12, 4
  ADD r8, r12
  LDI r12, 1
  SUB r3, r12
  JMP de_loop
de_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_towers -- colored squares by type
; ═══════════════════════════════════════════════════════════════
draw_towers:
  LDI r8, 0x2201
  LDI r7, 0x2200
  LOAD r3, r7

dt_loop:
  JZ r3, dt_done

  LOAD r6, r8
  LDI r12, 16
  MUL r6, r12
  MOV r7, r8
  LDI r12, 1
  ADD r7, r12
  LOAD r2, r7
  LDI r12, 16
  MUL r2, r12
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LOAD r7, r7

  ; color: 1=green, 2=red, 3=cyan
  LDI r12, 2
  CMP r7, r12
  BGE r15, dt_t2or3
  LDI r22, 0x00CC00
  JMP dt_draw
dt_t2or3:
  LDI r12, 3
  CMP r7, r12
  JZ r15, dt_t3
  LDI r22, 0xCC0000
  JMP dt_draw
dt_t3:
  LDI r22, 0x00CCCC

dt_draw:
  LDI r11, 16
  LDI r12, 16
  RECTF r6, r2, r11, r12, r22

dt_next:
  LDI r12, 4
  ADD r8, r12
  LDI r12, 1
  SUB r3, r12
  JMP dt_loop
dt_done:
  RET

; ═══════════════════════════════════════════════════════════════
; draw_cursor -- 2px white/colored border around cursor cell
; ═══════════════════════════════════════════════════════════════
draw_cursor:
  LDI r7, 0x2408
  LOAD r6, r7
  LDI r12, 16
  MUL r6, r12
  LDI r7, 0x2409
  LOAD r8, r7
  LDI r12, 16
  MUL r8, r12

  ; color by placing_type
  LDI r7, 0x240A
  LOAD r7, r7
  JZ r7, cur_white
  LDI r12, 2
  CMP r7, r12
  BGE r15, cur_t2or3
  LDI r22, 0x00FF00
  JMP cur_draw
cur_t2or3:
  LDI r12, 3
  CMP r7, r12
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
  LDI r11, 16
  LDI r12, 2
  RECTF r6, r8, r11, r12, r22
  ; bottom edge (y+14)
  MOV r7, r8
  LDI r12, 14
  ADD r7, r12
  RECTF r6, r7, r11, r12, r22
  ; left edge (y+2, x, 2, 12)
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  LDI r11, 2
  LDI r12, 12
  RECTF r6, r7, r11, r12, r22
  ; right edge (y+2, x+14, 2, 12)
  MOV r7, r8
  LDI r12, 2
  ADD r7, r12
  MOV r11, r6
  LDI r12, 14
  ADD r11, r12
  LDI r12, 2
  LDI r2, 12
  RECTF r11, r7, r12, r2, r22

  RET

; ═══════════════════════════════════════════════════════════════
; draw_ui -- colored indicators in the UI bar
; ═══════════════════════════════════════════════════════════════
draw_ui:
  ; Gold indicator (yellow bar, width proportional to gold)
  LDI r7, 0x2400
  LOAD r6, r7
  LDI r12, 200
  CMP r6, r12
  BLT r15, gold_ok
  MOV r6, r12
gold_ok:
  LDI r8, 228
  LDI r11, 8
  LDI r12, 8
  LDI r22, 0xFFCC00
  RECTF r6, r8, r11, r12, r22

  ; Lives indicator (small red squares)
  LDI r7, 0x2401
  LOAD r3, r7
  LDI r8, 100
  LDI r11, 4
  LDI r12, 4
  LDI r22, 0xFF4444
lives_lp:
  JZ r3, lives_end
  LDI r2, 228
  RECTF r8, r2, r11, r12, r22
  LDI r2, 6
  ADD r8, r2
  LDI r2, 1
  SUB r3, r2
  JMP lives_lp
lives_end:

  ; Wave dots (gray)
  LDI r7, 0x2402
  LOAD r3, r7
  LDI r8, 4
  LDI r11, 4
  LDI r12, 4
  LDI r22, 0xAAAAAA
wave_lp:
  JZ r3, wave_end
  LDI r2, 248
  RECTF r8, r2, r11, r12, r22
  LDI r2, 6
  ADD r8, r2
  LDI r2, 1
  SUB r3, r2
  JMP wave_lp
wave_end:

  ; Tower type legend (3 colored squares)
  LDI r6, 180
  LDI r8, 228
  LDI r11, 8
  LDI r12, 8
  LDI r22, 0x00CC00
  RECTF r6, r8, r11, r12, r22
  LDI r6, 200
  LDI r22, 0xCC0000
  RECTF r6, r8, r11, r12, r22
  LDI r6, 220
  LDI r22, 0x00CCCC
  RECTF r6, r8, r11, r12, r22

  RET
