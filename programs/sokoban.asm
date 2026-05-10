; sokoban.asm - Sokoban Puzzle Game
; Controls: WASD/Arrows=move, U=undo, R=restart, N=next level
;
; Memory map:
; 0x3000-0x3063: Active grid (10x10)
; 0x3100-0x3163: Level 1
; 0x3200-0x3263: Level 2
; 0x3300-0x3363: Level 3
; 0x3400: current_level
; 0x3401: player_x
; 0x3402: player_y
; 0x3403: move_count
; 0x3404: solved
; 0x3405: undo_count
; 0x3500-0x35FF: Undo stack (4 words each)
;
; Tile: 0=floor 1=wall 2=player 3=box 4=target 5=box+target 6=player+target

; ===== LEVEL 1 DATA (1 box, 1 target) =====
; Row 0: WWWWWWWWWW
LDI r7, 0x3100
LDI r6, 1
STORE r7, r6
LDI r7, 0x3101
STORE r7, r6
LDI r7, 0x3102
STORE r7, r6
LDI r7, 0x3103
STORE r7, r6
LDI r7, 0x3104
STORE r7, r6
LDI r7, 0x3105
STORE r7, r6
LDI r7, 0x3106
STORE r7, r6
LDI r7, 0x3107
STORE r7, r6
LDI r7, 0x3108
STORE r7, r6
LDI r7, 0x3109
STORE r7, r6
; Row 1: W........W
LDI r7, 0x3110
STORE r7, r6
LDI r7, 0x3119
STORE r7, r6
; Row 2: W........W
LDI r7, 0x3120
STORE r7, r6
LDI r7, 0x3129
STORE r7, r6
; Row 3: W........W
LDI r7, 0x3130
STORE r7, r6
LDI r7, 0x3139
STORE r7, r6
; Row 4: W...B....W
LDI r7, 0x3140
STORE r7, r6
LDI r7, 0x3144
LDI r6, 3
STORE r7, r6
LDI r6, 1
LDI r7, 0x3149
STORE r7, r6
; Row 5: W...T....W
LDI r7, 0x3150
STORE r7, r6
LDI r7, 0x3154
LDI r6, 4
STORE r7, r6
LDI r6, 1
LDI r7, 0x3159
STORE r7, r6
; Row 6: W...P....W
LDI r7, 0x3160
STORE r7, r6
LDI r7, 0x3164
LDI r6, 2
STORE r7, r6
LDI r6, 1
LDI r7, 0x3169
STORE r7, r6
; Rows 7-9
LDI r7, 0x3170
STORE r7, r6
LDI r7, 0x3179
STORE r7, r6
LDI r7, 0x3180
STORE r7, r6
LDI r7, 0x3189
STORE r7, r6
LDI r7, 0x3190
STORE r7, r6
LDI r7, 0x3191
STORE r7, r6
LDI r7, 0x3192
STORE r7, r6
LDI r7, 0x3193
STORE r7, r6
LDI r7, 0x3194
STORE r7, r6
LDI r7, 0x3195
STORE r7, r6
LDI r7, 0x3196
STORE r7, r6
LDI r7, 0x3197
STORE r7, r6
LDI r7, 0x3198
STORE r7, r6
LDI r7, 0x3199
STORE r7, r6

; ===== LEVEL 2 DATA (2 boxes, 2 targets) =====
; Row 0: WWWWWWWWWW
LDI r7, 0x3200
LDI r6, 1
STORE r7, r6
LDI r7, 0x3201
STORE r7, r6
LDI r7, 0x3202
STORE r7, r6
LDI r7, 0x3203
STORE r7, r6
LDI r7, 0x3204
STORE r7, r6
LDI r7, 0x3205
STORE r7, r6
LDI r7, 0x3206
STORE r7, r6
LDI r7, 0x3207
STORE r7, r6
LDI r7, 0x3208
STORE r7, r6
LDI r7, 0x3209
STORE r7, r6
; Row 1
LDI r7, 0x3210
STORE r7, r6
LDI r7, 0x3219
STORE r7, r6
; Row 2: W..WW....W
LDI r7, 0x3220
STORE r7, r6
LDI r7, 0x3223
STORE r7, r6
LDI r7, 0x3224
STORE r7, r6
LDI r7, 0x3229
STORE r7, r6
; Row 3: W..WB.W..W
LDI r7, 0x3230
STORE r7, r6
LDI r7, 0x3233
STORE r7, r6
LDI r7, 0x3234
LDI r6, 3
STORE r7, r6
LDI r6, 1
LDI r7, 0x3236
STORE r7, r6
LDI r7, 0x3239
STORE r7, r6
; Row 4: W..WT....W
LDI r7, 0x3240
STORE r7, r6
LDI r7, 0x3243
STORE r7, r6
LDI r7, 0x3244
LDI r6, 4
STORE r7, r6
LDI r6, 1
LDI r7, 0x3249
STORE r7, r6
; Row 5: W..B.T.P.W
LDI r7, 0x3250
STORE r7, r6
LDI r7, 0x3253
LDI r6, 3
STORE r7, r6
LDI r6, 1
LDI r7, 0x3255
LDI r6, 4
STORE r7, r6
LDI r6, 1
LDI r7, 0x3257
LDI r6, 2
STORE r7, r6
LDI r6, 1
LDI r7, 0x3259
STORE r7, r6
; Rows 6-8
LDI r7, 0x3260
STORE r7, r6
LDI r7, 0x3269
STORE r7, r6
LDI r7, 0x3270
STORE r7, r6
LDI r7, 0x3279
STORE r7, r6
LDI r7, 0x3280
STORE r7, r6
LDI r7, 0x3289
STORE r7, r6
; Row 9
LDI r7, 0x3290
STORE r7, r6
LDI r7, 0x3291
STORE r7, r6
LDI r7, 0x3292
STORE r7, r6
LDI r7, 0x3293
STORE r7, r6
LDI r7, 0x3294
STORE r7, r6
LDI r7, 0x3295
STORE r7, r6
LDI r7, 0x3296
STORE r7, r6
LDI r7, 0x3297
STORE r7, r6
LDI r7, 0x3298
STORE r7, r6
LDI r7, 0x3299
STORE r7, r6

; ===== LEVEL 3 DATA (3 boxes, requires planning) =====
; Row 0: WWWWWWWWWW
LDI r7, 0x3300
LDI r6, 1
STORE r7, r6
LDI r7, 0x3301
STORE r7, r6
LDI r7, 0x3302
STORE r7, r6
LDI r7, 0x3303
STORE r7, r6
LDI r7, 0x3304
STORE r7, r6
LDI r7, 0x3305
STORE r7, r6
LDI r7, 0x3306
STORE r7, r6
LDI r7, 0x3307
STORE r7, r6
LDI r7, 0x3308
STORE r7, r6
LDI r7, 0x3309
STORE r7, r6
; Row 1
LDI r7, 0x3310
STORE r7, r6
LDI r7, 0x3319
STORE r7, r6
; Row 2: W.WWWWW..W
LDI r7, 0x3320
STORE r7, r6
LDI r7, 0x3322
STORE r7, r6
LDI r7, 0x3323
STORE r7, r6
LDI r7, 0x3324
STORE r7, r6
LDI r7, 0x3325
STORE r7, r6
LDI r7, 0x3326
STORE r7, r6
LDI r7, 0x3329
STORE r7, r6
; Row 3: W.W...W..W
LDI r7, 0x3330
STORE r7, r6
LDI r7, 0x3332
STORE r7, r6
LDI r7, 0x3336
STORE r7, r6
LDI r7, 0x3339
STORE r7, r6
; Row 4: W.W.B.W.TW
LDI r7, 0x3340
STORE r7, r6
LDI r7, 0x3342
STORE r7, r6
LDI r7, 0x3344
LDI r6, 3
STORE r7, r6
LDI r6, 1
LDI r7, 0x3346
STORE r7, r6
LDI r7, 0x3348
LDI r6, 4
STORE r7, r6
LDI r6, 1
LDI r7, 0x3349
STORE r7, r6
; Row 5: W...B..T.W
LDI r7, 0x3350
STORE r7, r6
LDI r7, 0x3354
LDI r6, 3
STORE r7, r6
LDI r6, 1
LDI r7, 0x3357
LDI r6, 4
STORE r7, r6
LDI r6, 1
LDI r7, 0x3359
STORE r7, r6
; Row 6: W.P.B..T.W
LDI r7, 0x3360
STORE r7, r6
LDI r7, 0x3362
LDI r6, 2
STORE r7, r6
LDI r6, 1
LDI r7, 0x3364
LDI r6, 3
STORE r7, r6
LDI r6, 1
LDI r7, 0x3367
LDI r6, 4
STORE r7, r6
LDI r6, 1
LDI r7, 0x3369
STORE r7, r6
; Row 7: W.WWWWW..W
LDI r7, 0x3370
LDI r6, 1
STORE r7, r6
LDI r7, 0x3372
STORE r7, r6
LDI r7, 0x3373
STORE r7, r6
LDI r7, 0x3374
STORE r7, r6
LDI r7, 0x3375
STORE r7, r6
LDI r7, 0x3376
STORE r7, r6
LDI r7, 0x3379
STORE r7, r6
; Row 8
LDI r7, 0x3380
STORE r7, r6
LDI r7, 0x3389
STORE r7, r6
; Row 9
LDI r7, 0x3390
STORE r7, r6
LDI r7, 0x3391
STORE r7, r6
LDI r7, 0x3392
STORE r7, r6
LDI r7, 0x3393
STORE r7, r6
LDI r7, 0x3394
STORE r7, r6
LDI r7, 0x3395
STORE r7, r6
LDI r7, 0x3396
STORE r7, r6
LDI r7, 0x3397
STORE r7, r6
LDI r7, 0x3398
STORE r7, r6
LDI r7, 0x3399
STORE r7, r6

; ===== INIT =====
LDI r6, 0
LDI r7, 0x3400
STORE r7, r6
LDI r7, 0x3405
STORE r7, r6
CALL load_level

; ===== MAIN LOOP =====
main_loop:
CALL draw_grid
CALL draw_hud
FRAME
CALL handle_input
JMP main_loop

; ===== LOAD LEVEL =====
load_level:
PUSH r31
LDI r10, 0
clear_loop:
LDI r6, 100
CMP r10, r6
BGE r0, clear_done
LDI r7, 0x3000
ADD r7, r10
LDI r6, 0
STORE r7, r6
LDI r6, 1
ADD r10, r6
JMP clear_loop
clear_done:
LDI r7, 0x3400
LOAD r14, r7
LDI r13, 0x3100
LDI r6, 1
CMP r14, r6
BGE r0, check_l2
JMP do_copy
check_l2:
LDI r6, 2
CMP r14, r6
BGE r0, is_l3
LDI r13, 0x3200
JMP do_copy
is_l3:
LDI r13, 0x3300
do_copy:
LDI r10, 0
copy_loop:
LDI r6, 100
CMP r10, r6
BGE r0, copy_done
MOV r7, r13
ADD r7, r10
LOAD r6, r7
LDI r7, 0x3000
ADD r7, r10
STORE r7, r6
LDI r6, 1
ADD r10, r6
JMP copy_loop
copy_done:
LDI r7, 0x3403
LDI r6, 0
STORE r7, r6
LDI r7, 0x3404
STORE r7, r6
LDI r7, 0x3405
STORE r7, r6
CALL find_player
POP r31
RET

; ===== FIND PLAYER =====
find_player:
PUSH r31
LDI r10, 0
fp_loop:
LDI r6, 100
CMP r10, r6
BGE r0, fp_done
LDI r7, 0x3000
ADD r7, r10
LOAD r6, r7
LDI r11, 2
CMP r6, r11
JZ r0, fp_found
LDI r11, 6
CMP r6, r11
JZ r0, fp_found
LDI r6, 1
ADD r10, r6
JMP fp_loop
fp_found:
LDI r7, 0x3401
MOV r6, r10
LDI r11, 10
MOD r6, r11
STORE r7, r6
LDI r7, 0x3402
MOV r6, r10
LDI r11, 10
DIV r6, r11
STORE r7, r6
fp_done:
POP r31
RET

; ===== DRAW GRID =====
draw_grid:
PUSH r31
LDI r1, 0
LDI r2, 0
LDI r3, 256
LDI r4, 256
LDI r5, 0x111122
RECTF r1, r2, r3, r4, r5
LDI r10, 0
dg_loop:
LDI r6, 100
CMP r10, r6
BGE r0, dg_done
CALL draw_tile
LDI r6, 1
ADD r10, r6
JMP dg_loop
dg_done:
POP r31
RET

; ===== DRAW TILE =====
draw_tile:
PUSH r31
MOV r11, r10
LDI r6, 10
MOD r11, r6
MOV r12, r10
LDI r6, 10
DIV r12, r6
MOV r13, r11
LDI r6, 16
MUL r13, r6
LDI r6, 48
ADD r13, r6
MOV r14, r12
LDI r6, 16
MUL r14, r6
LDI r6, 16
ADD r14, r6
LDI r7, 0x3000
ADD r7, r10
LOAD r15, r7
LDI r16, 0x222222
LDI r6, 1
CMP r15, r6
JNZ r0, not_wall
LDI r16, 0x888888
JMP got_color
not_wall:
LDI r6, 2
CMP r15, r6
JNZ r0, not_player
LDI r16, 0x00FF00
JMP got_color
not_player:
LDI r6, 3
CMP r15, r6
JNZ r0, not_box
LDI r16, 0xCCAA44
JMP got_color
not_box:
LDI r6, 4
CMP r15, r6
JNZ r0, not_target
LDI r16, 0xFF0000
JMP got_color
not_target:
LDI r6, 5
CMP r15, r6
JNZ r0, not_bot
LDI r16, 0x00CC88
JMP got_color
not_bot:
LDI r6, 6
CMP r15, r6
JNZ r0, got_color
LDI r16, 0x0088FF
got_color:
LDI r4, 16
RECTF r13, r14, r4, r4, r16
POP r31
RET

; ===== DRAW HUD =====
draw_hud:
PUSH r31
; Level text at 0x3800: "Lv" + digit
LDI r1, 0x3800
LDI r2, 76
STORE r1, r2
LDI r2, 118
LDI r3, 0x3801
STORE r3, r2
LDI r2, 58
LDI r3, 0x3802
STORE r3, r2
LDI r7, 0x3400
LOAD r2, r7
LDI r6, 48
ADD r2, r6
LDI r3, 0x3803
STORE r3, r2
LDI r2, 0
LDI r3, 0x3804
STORE r3, r2
LDI r1, 2
LDI r2, 2
LDI r3, 0x3800
TEXT r1, r2, r3
; Moves text at 0x3820: "Mv" + 3 digits
LDI r1, 0x3820
LDI r2, 77
STORE r1, r2
LDI r2, 118
LDI r3, 0x3821
STORE r3, r2
LDI r2, 58
LDI r3, 0x3822
STORE r3, r2
LDI r7, 0x3403
LOAD r2, r7
LDI r6, 100
DIV r15, r6
LDI r6, 48
ADD r15, r6
LDI r3, 0x3823
STORE r3, r15
LDI r7, 0x3403
LOAD r2, r7
LDI r6, 100
MOD r2, r6
LDI r6, 10
DIV r15, r6
LDI r6, 48
ADD r15, r6
LDI r3, 0x3824
STORE r3, r15
LDI r7, 0x3403
LOAD r2, r7
LDI r6, 10
MOD r15, r6
LDI r6, 48
ADD r15, r6
LDI r3, 0x3825
STORE r3, r15
LDI r2, 0
LDI r3, 0x3826
STORE r3, r2
LDI r1, 2
LDI r2, 180
LDI r3, 0x3820
TEXT r1, r2, r3
; Solved check
LDI r7, 0x3404
LOAD r6, r7
LDI r11, 1
CMP r6, r11
JNZ r0, no_solved
LDI r1, 0x3850
LDI r2, 83
STORE r1, r2
LDI r2, 79
LDI r3, 0x3851
STORE r3, r2
LDI r2, 76
LDI r3, 0x3852
STORE r3, r2
LDI r2, 86
LDI r3, 0x3853
STORE r3, r2
LDI r2, 69
LDI r3, 0x3854
STORE r3, r2
LDI r2, 68
LDI r3, 0x3855
STORE r3, r2
LDI r2, 33
LDI r3, 0x3856
STORE r3, r2
LDI r2, 0
LDI r3, 0x3857
STORE r3, r2
LDI r1, 80
LDI r2, 130
LDI r3, 0x3850
TEXT r1, r2, r3
no_solved:
POP r31
RET

; ===== HANDLE INPUT =====
handle_input:
PUSH r31
IKEY r10
LDI r11, 0
CMP r10, r11
JZ r0, hi_done
; Check solved state
LDI r7, 0x3404
LOAD r6, r7
LDI r11, 1
CMP r6, r11
JNZ r0, not_solved_input
LDI r11, 78
CMP r10, r11
JNZ r0, check_r_solved
CALL next_level
JMP hi_done
check_r_solved:
LDI r11, 82
CMP r10, r11
JNZ r0, hi_done
CALL restart_level
JMP hi_done
not_solved_input:
; Up (W=87)
LDI r11, 87
CMP r10, r11
JNZ r0, not_up
LDI r10, 0
LDI r11, 255
CALL try_move
JMP hi_done
not_up:
; Down (S=83)
LDI r11, 83
CMP r10, r11
JNZ r0, not_down
LDI r10, 1
LDI r11, 0
CALL try_move
JMP hi_done
not_down:
; Left (A=65)
LDI r11, 65
CMP r10, r11
JNZ r0, not_left
LDI r10, 255
LDI r11, 0
CALL try_move
JMP hi_done
not_left:
; Right (D=68)
LDI r11, 68
CMP r10, r11
JNZ r0, not_right
LDI r10, 1
LDI r11, 0
CALL try_move
JMP hi_done
not_right:
; Undo (U=85)
LDI r11, 85
CMP r10, r11
JNZ r0, not_undo
CALL do_undo
JMP hi_done
not_undo:
; Restart (R=82)
LDI r11, 82
CMP r10, r11
JNZ r0, not_restart
CALL restart_level
JMP hi_done
not_restart:
; Next level (N=78)
LDI r11, 78
CMP r10, r11
JNZ r0, hi_done
CALL next_level
hi_done:
POP r31
RET

; ===== TRY MOVE =====
; r10 = dx (255=left, 0=up/down, 1=right)
; r11 = dy (255=up, 0=left/right, 1=down)
try_move:
PUSH r31
LDI r7, 0x3401
LOAD r12, r7
LDI r7, 0x3402
LOAD r13, r7
MOV r14, r12
ADD r14, r10
LDI r6, 10
MOD r14, r6
MOV r15, r13
ADD r15, r11
LDI r6, 10
MOD r15, r6
; Read tile at new pos
MOV r6, r15
LDI r9, 10
MUL r6, r9
ADD r6, r14
LDI r7, 0x3000
ADD r7, r6
LOAD r16, r7
; Wall check
LDI r6, 1
CMP r16, r6
JNZ r0, not_wall2
POP r31
RET
not_wall2:
; Box check (3 or 5)
LDI r6, 3
CMP r16, r6
JNZ r0, not_box2
JMP try_push
not_box2:
LDI r6, 5
CMP r16, r6
JNZ r0, do_move
try_push:
; Compute beyond-box pos
MOV r17, r14
ADD r17, r10
LDI r6, 10
MOD r17, r6
MOV r18, r15
ADD r18, r11
LDI r6, 10
MOD r18, r6
; Read tile beyond box
MOV r6, r18
LDI r9, 10
MUL r6, r9
ADD r6, r17
LDI r7, 0x3000
ADD r7, r6
LOAD r19, r7
; Check: wall or box blocks push
LDI r6, 1
CMP r19, r6
JZ r0, push_fail
LDI r6, 3
CMP r19, r6
JZ r0, push_fail
LDI r6, 5
CMP r19, r6
JZ r0, push_fail
JMP do_push
push_fail:
POP r31
RET
do_push:
CALL push_undo
; Place box at beyond pos (3 or 5 if target)
MOV r6, r18
LDI r9, 10
MUL r6, r9
ADD r6, r17
LDI r7, 0x3000
ADD r7, r6
LDI r6, 3
LDI r9, 4
CMP r19, r9
JNZ r0, not_target_beyond
LDI r6, 5
not_target_beyond:
STORE r7, r6
; Clear box from old pos (leave target if was 5)
MOV r6, r15
LDI r9, 10
MUL r6, r9
ADD r6, r14
LDI r7, 0x3000
ADD r7, r6
LDI r6, 0
LDI r9, 5
CMP r16, r9
JNZ r0, box_was_plain
LDI r6, 4
box_was_plain:
STORE r7, r6
JMP update_player
do_move:
CALL push_undo
update_player:
; Clear old player pos
MOV r6, r13
LDI r9, 10
MUL r6, r9
ADD r6, r12
LDI r7, 0x3000
ADD r7, r6
LDI r6, 0
STORE r7, r6
; Place player at new pos (2 or 6 if target)
MOV r6, r15
LDI r9, 10
MUL r6, r9
ADD r6, r14
LDI r7, 0x3000
ADD r7, r6
LOAD r19, r7
LDI r6, 2
LDI r9, 4
CMP r19, r9
JNZ r0, not_target_new
LDI r6, 6
not_target_new:
STORE r7, r6
; Update state
LDI r7, 0x3401
STORE r7, r14
LDI r7, 0x3402
STORE r7, r15
LDI r7, 0x3403
LOAD r6, r7
LDI r9, 1
ADD r6, r9
STORE r7, r6
CALL check_win
POP r31
RET

; ===== PUSH UNDO =====
push_undo:
PUSH r31
LDI r7, 0x3405
LOAD r6, r7
LDI r9, 50
CMP r6, r9
BGE r0, undo_full
MOV r10, r6
LDI r9, 4
MUL r10, r9
LDI r7, 0x3500
ADD r7, r10
LDI r8, 0x3401
LOAD r6, r8
STORE r7, r6
LDI r9, 1
ADD r7, r9
LDI r8, 0x3402
LOAD r6, r8
STORE r7, r6
LDI r9, 1
ADD r7, r9
; Store grid index of player
LDI r8, 0x3402
LOAD r6, r8
LDI r11, 10
MUL r6, r11
LDI r8, 0x3401
LOAD r11, r8
ADD r6, r11
STORE r7, r6
LDI r9, 1
ADD r7, r9
; Store tile value at player pos
LDI r8, 0x3000
ADD r8, r6
LOAD r6, r8
STORE r7, r6
; Increment undo count
LDI r7, 0x3405
LOAD r6, r7
LDI r9, 1
ADD r6, r9
STORE r7, r6
undo_full:
POP r31
RET

; ===== DO UNDO =====
do_undo:
PUSH r31
LDI r7, 0x3405
LOAD r6, r7
LDI r9, 0
CMP r6, r9
JZ r0, no_undo
LDI r9, 1
SUB r6, r9
STORE r7, r6
MOV r10, r6
LDI r9, 4
MUL r10, r9
LDI r7, 0x3500
ADD r7, r10
LOAD r12, r7
LDI r9, 1
ADD r7, r9
LOAD r13, r7
LDI r9, 1
ADD r7, r9
LOAD r14, r7
LDI r9, 1
ADD r7, r9
LOAD r15, r7
LDI r7, 0x3401
STORE r7, r12
LDI r7, 0x3402
STORE r7, r13
LDI r7, 0x3000
ADD r7, r14
STORE r7, r15
no_undo:
POP r31
RET

; ===== CHECK WIN =====
check_win:
PUSH r31
LDI r10, 0
cw_loop:
LDI r6, 100
CMP r10, r6
BGE r0, cw_done
LDI r7, 0x3000
ADD r7, r10
LOAD r6, r7
LDI r9, 4
CMP r6, r9
JZ r0, cw_not_won
LDI r6, 1
ADD r10, r6
JMP cw_loop
cw_not_won:
POP r31
RET
cw_done:
LDI r7, 0x3404
LDI r6, 1
STORE r7, r6
POP r31
RET

; ===== RESTART LEVEL =====
restart_level:
PUSH r31
CALL load_level
POP r31
RET

; ===== NEXT LEVEL =====
next_level:
PUSH r31
LDI r7, 0x3400
LOAD r6, r7
LDI r9, 1
ADD r6, r9
LDI r9, 3
CMP r6, r9
BGE r0, nl_wrap
STORE r7, r6
JMP nl_load
nl_wrap:
LDI r6, 0
STORE r7, r6
nl_load:
CALL load_level
POP r31
RET

HALT
