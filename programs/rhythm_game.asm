; rhythm_game.asm -- Rhythm game with 4 falling-note lanes
; Phase 384: GeOS Program -- Rhythm Game
;
; Deliverables:
;   1. Falling note lanes with timing windows (Perfect +-8, Good +-20)
;   2. Score based on timing accuracy (Perfect=300, Good=100, Miss=0)
;   3. BEEP-based audio feedback (Perfect=880Hz, Good=660Hz, Miss=220Hz)
;
; Controls: Arrow keys
;   Left = lane 0, Down = lane 1, Up = lane 2, Right = lane 3
;
; Memory (game state at 0x2000):
;   0x2000  score (u32)
;   0x2001  combo (u32)
;   0x2002  max_combo (u32)
;   0x2003  perfect_count (u32)
;   0x2004  good_count (u32)
;   0x2005  miss_count (u32)
;   0x2006  spawn_timer (u32, frames until next beat)
;   0x2007  song_pos (u32, index into song data)
;   0x2008  feedback_timer (u32, frames of feedback remaining)
;   0x2009  feedback_type (0=none, 1=perfect, 2=good, 3=miss)
;
; Lane notes (1 note per lane max):
;   0x2100  lane0_y (0=no note, 1-255=active y position)
;   0x2101  lane1_y
;   0x2102  lane2_y
;   0x2103  lane3_y
;
; Song data (16 beats at 0x2200, loops):
;   Each word = 4-bit lane mask (bit0=L, bit1=D, bit2=U, bit3=R)
;
; Key bitmask (0xFFB): bit0=up, bit1=down, bit2=left, bit3=right
; Lane mapping: lane0=left(bit2), lane1=down(bit1), lane2=up(bit0), lane3=right(bit3)

; ── Init ────────────────────────────────────────
init:
  LDI r30, 0x8000           ; stack pointer

  ; Zero game state (0x2000-0x2009, 10 words)
  LDI r10, 0
  LDI r11, 0x2000
  LDI r12, 10
zero_state:
  STORE r11, r10
  LDI r1, 1
  ADD r11, r1
  SUB r12, r1
  JNZ r12, zero_state

  ; Set spawn timer
  LDI r1, 25
  LDI r4, 0x2006
  STORE r4, r1

  ; Clear lane notes
  LDI r4, 0x2100
  STORE r4, r10
  LDI r4, 0x2101
  STORE r4, r10
  LDI r4, 0x2102
  STORE r4, r10
  LDI r4, 0x2103
  STORE r4, r10

  ; ── Init song data (16 beats) ────────────────
  LDI r4, 0x2200
  LDI r1, 1
  STORE r4, r1              ; beat 0: L
  LDI r4, 0x2201
  LDI r1, 2
  STORE r4, r1              ; beat 1: D
  LDI r4, 0x2202
  LDI r1, 4
  STORE r4, r1              ; beat 2: U
  LDI r4, 0x2203
  LDI r1, 8
  STORE r4, r1              ; beat 3: R
  LDI r4, 0x2204
  LDI r1, 1
  STORE r4, r1              ; beat 4: L
  LDI r4, 0x2205
  LDI r1, 8
  STORE r4, r1              ; beat 5: R
  LDI r4, 0x2206
  LDI r1, 2
  STORE r4, r1              ; beat 6: D
  LDI r4, 0x2207
  LDI r1, 4
  STORE r4, r1              ; beat 7: U
  LDI r4, 0x2208
  LDI r1, 3
  STORE r4, r1              ; beat 8: L+D
  LDI r4, 0x2209
  LDI r1, 12
  STORE r4, r1              ; beat 9: U+R
  LDI r4, 0x220A
  LDI r1, 5
  STORE r4, r1              ; beat 10: L+U
  LDI r4, 0x220B
  LDI r1, 10
  STORE r4, r1              ; beat 11: D+R
  LDI r4, 0x220C
  LDI r1, 1
  STORE r4, r1              ; beat 12: L
  LDI r4, 0x220D
  LDI r1, 4
  STORE r4, r1              ; beat 13: U
  LDI r4, 0x220E
  LDI r1, 2
  STORE r4, r1              ; beat 14: D
  LDI r4, 0x220F
  LDI r1, 8
  STORE r4, r1              ; beat 15: R

; ── Main Game Loop ──────────────────────────────
game_loop:
  ; Read key bitmask (preserved in r5 for entire frame)
  LDI r4, 0xFFB
  LOAD r5, r4

  ; ══ 1. SPAWN ════════════════════════════════
  LDI r4, 0x2006
  LOAD r1, r4
  LDI r2, 1
  SUB r1, r2
  STORE r4, r1
  JNZ r1, no_spawn

  ; Timer expired -- spawn beat
  LDI r1, 25
  STORE r4, r1

  ; Get current beat mask
  LDI r4, 0x2007
  LOAD r10, r4
  LDI r11, 0x2200
  ADD r11, r10
  LOAD r12, r11

  ; Spawn in each lane if bit set and lane empty
  ; Lane 0 (bit 0)
  LDI r1, 1
  AND r1, r12
  JZ r1, sp0
  LDI r4, 0x2100
  LOAD r1, r4
  JNZ r1, sp0
  LDI r1, 1
  STORE r4, r1
sp0:
  ; Lane 1 (bit 1)
  LDI r1, 2
  AND r1, r12
  JZ r1, sp1
  LDI r4, 0x2101
  LOAD r1, r4
  JNZ r1, sp1
  LDI r1, 1
  STORE r4, r1
sp1:
  ; Lane 2 (bit 2)
  LDI r1, 4
  AND r1, r12
  JZ r1, sp2
  LDI r4, 0x2102
  LOAD r1, r4
  JNZ r1, sp2
  LDI r1, 1
  STORE r4, r1
sp2:
  ; Lane 3 (bit 3)
  LDI r1, 8
  AND r1, r12
  JZ r1, sp3
  LDI r4, 0x2103
  LOAD r1, r4
  JNZ r1, sp3
  LDI r1, 1
  STORE r4, r1
sp3:

  ; Advance song position (loop at 16)
  LDI r4, 0x2007
  LOAD r1, r4
  LDI r2, 1
  ADD r1, r2
  LDI r2, 16
  CMP r1, r2
  BLT r0, spos_ok
  LDI r1, 0
spos_ok:
  STORE r4, r1

no_spawn:
  ; ══ 2. MOVE NOTES (no miss check yet) ═══════
  ; Lane 0
  LDI r4, 0x2100
  LOAD r1, r4
  JZ r1, mv0
  LDI r2, 3
  ADD r1, r2
  STORE r4, r1
mv0:
  ; Lane 1
  LDI r4, 0x2101
  LOAD r1, r4
  JZ r1, mv1
  LDI r2, 3
  ADD r1, r2
  STORE r4, r1
mv1:
  ; Lane 2
  LDI r4, 0x2102
  LOAD r1, r4
  JZ r1, mv2
  LDI r2, 3
  ADD r1, r2
  STORE r4, r1
mv2:
  ; Lane 3
  LDI r4, 0x2103
  LOAD r1, r4
  JZ r1, mv3
  LDI r2, 3
  ADD r1, r2
  STORE r4, r1
mv3:

  ; ══ 3. CHECK HITS ══════════════════════════
  ; Lane 0 -> Left key (bit 2)
  LDI r4, 0x2100
  LOAD r1, r4
  JZ r1, hl0
  LDI r2, 4
  AND r2, r5
  JZ r2, hl0
  ; Compute abs(y - 220)
  LDI r3, 220
  MOV r6, r1
  SUB r6, r3
  MOV r7, r6
  LDI r8, 31
  SAR r7, r8
  JZ r7, abs0
  NEG r6
abs0:
  LDI r3, 9
  CMP r6, r3
  BLT r0, perf0
  LDI r3, 21
  CMP r6, r3
  BGE r0, hl0
  PUSH r31
  CALL do_good
  POP r31
  LDI r4, 0x2100
  LDI r1, 0
  STORE r4, r1
  JMP hl0
perf0:
  PUSH r31
  CALL do_perfect
  POP r31
  LDI r4, 0x2100
  LDI r1, 0
  STORE r4, r1
hl0:

  ; Lane 1 -> Down key (bit 1)
  LDI r4, 0x2101
  LOAD r1, r4
  JZ r1, hl1
  LDI r2, 2
  AND r2, r5
  JZ r2, hl1
  LDI r3, 220
  MOV r6, r1
  SUB r6, r3
  MOV r7, r6
  LDI r8, 31
  SAR r7, r8
  JZ r7, abs1
  NEG r6
abs1:
  LDI r3, 9
  CMP r6, r3
  BLT r0, perf1
  LDI r3, 21
  CMP r6, r3
  BGE r0, hl1
  PUSH r31
  CALL do_good
  POP r31
  LDI r4, 0x2101
  LDI r1, 0
  STORE r4, r1
  JMP hl1
perf1:
  PUSH r31
  CALL do_perfect
  POP r31
  LDI r4, 0x2101
  LDI r1, 0
  STORE r4, r1
hl1:

  ; Lane 2 -> Up key (bit 0)
  LDI r4, 0x2102
  LOAD r1, r4
  JZ r1, hl2
  LDI r2, 1
  AND r2, r5
  JZ r2, hl2
  LDI r3, 220
  MOV r6, r1
  SUB r6, r3
  MOV r7, r6
  LDI r8, 31
  SAR r7, r8
  JZ r7, abs2
  NEG r6
abs2:
  LDI r3, 9
  CMP r6, r3
  BLT r0, perf2
  LDI r3, 21
  CMP r6, r3
  BGE r0, hl2
  PUSH r31
  CALL do_good
  POP r31
  LDI r4, 0x2102
  LDI r1, 0
  STORE r4, r1
  JMP hl2
perf2:
  PUSH r31
  CALL do_perfect
  POP r31
  LDI r4, 0x2102
  LDI r1, 0
  STORE r4, r1
hl2:

  ; Lane 3 -> Right key (bit 3)
  LDI r4, 0x2103
  LOAD r1, r4
  JZ r1, hl3
  LDI r2, 8
  AND r2, r5
  JZ r2, hl3
  LDI r3, 220
  MOV r6, r1
  SUB r6, r3
  MOV r7, r6
  LDI r8, 31
  SAR r7, r8
  JZ r7, abs3
  NEG r6
abs3:
  LDI r3, 9
  CMP r6, r3
  BLT r0, perf3
  LDI r3, 21
  CMP r6, r3
  BGE r0, hl3
  PUSH r31
  CALL do_good
  POP r31
  LDI r4, 0x2103
  LDI r1, 0
  STORE r4, r1
  JMP hl3
perf3:
  PUSH r31
  CALL do_perfect
  POP r31
  LDI r4, 0x2103
  LDI r1, 0
  STORE r4, r1
hl3:

  ; ══ 4. CHECK MISSES (notes past bottom) ═════
  ; Lane 0
  LDI r4, 0x2100
  LOAD r1, r4
  JZ r1, ms0
  LDI r2, 241
  CMP r1, r2
  BLT r0, ms0
  LDI r1, 0
  STORE r4, r1
  PUSH r31
  CALL do_miss
  POP r31
ms0:
  ; Lane 1
  LDI r4, 0x2101
  LOAD r1, r4
  JZ r1, ms1
  LDI r2, 241
  CMP r1, r2
  BLT r0, ms1
  LDI r1, 0
  STORE r4, r1
  PUSH r31
  CALL do_miss
  POP r31
ms1:
  ; Lane 2
  LDI r4, 0x2102
  LOAD r1, r4
  JZ r1, ms2
  LDI r2, 241
  CMP r1, r2
  BLT r0, ms2
  LDI r1, 0
  STORE r4, r1
  PUSH r31
  CALL do_miss
  POP r31
ms2:
  ; Lane 3
  LDI r4, 0x2103
  LOAD r1, r4
  JZ r1, ms3
  LDI r2, 241
  CMP r1, r2
  BLT r0, ms3
  LDI r1, 0
  STORE r4, r1
  PUSH r31
  CALL do_miss
  POP r31
ms3:

  ; ══ 5. DRAW ════════════════════════════════
  PUSH r31
  CALL draw_frame
  POP r31

  ; Decrement feedback timer
  LDI r4, 0x2008
  LOAD r1, r4
  JZ r1, no_fbdec
  LDI r2, 1
  SUB r1, r2
  STORE r4, r1
no_fbdec:

  FRAME
  JMP game_loop

; ── do_perfect: +300 score, combo++, BEEP 880Hz ──
do_perfect:
  PUSH r31
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r2, 300
  ADD r1, r2
  STORE r4, r1
  LDI r4, 0x2001
  LOAD r1, r4
  LDI r2, 1
  ADD r1, r2
  STORE r4, r1
  LDI r4, 0x2003
  LOAD r1, r4
  ADD r1, r2
  STORE r4, r1
  ; Update max combo
  LDI r4, 0x2001
  LOAD r10, r4
  LDI r4, 0x2002
  LOAD r11, r4
  CMP r10, r11
  BLT r0, nomxp
  LDI r4, 0x2002
  STORE r4, r10
nomxp:
  LDI r4, 0x2008
  LDI r1, 15
  STORE r4, r1
  LDI r4, 0x2009
  LDI r1, 1
  STORE r4, r1
  LDI r20, 880
  LDI r21, 80
  BEEP r20, r21
  POP r31
  RET

; ── do_good: +100 score, combo++, BEEP 660Hz ──
do_good:
  PUSH r31
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r2, 100
  ADD r1, r2
  STORE r4, r1
  LDI r4, 0x2001
  LOAD r1, r4
  LDI r2, 1
  ADD r1, r2
  STORE r4, r1
  LDI r4, 0x2004
  LOAD r1, r4
  ADD r1, r2
  STORE r4, r1
  ; Update max combo
  LDI r4, 0x2001
  LOAD r10, r4
  LDI r4, 0x2002
  LOAD r11, r4
  CMP r10, r11
  BLT r0, nomxg
  LDI r4, 0x2002
  STORE r4, r10
nomxg:
  LDI r4, 0x2008
  LDI r1, 15
  STORE r4, r1
  LDI r4, 0x2009
  LDI r1, 2
  STORE r4, r1
  LDI r20, 660
  LDI r21, 80
  BEEP r20, r21
  POP r31
  RET

; ── do_miss: reset combo, miss++, BEEP 220Hz ──
do_miss:
  PUSH r31
  LDI r4, 0x2001
  LDI r1, 0
  STORE r4, r1
  LDI r4, 0x2005
  LOAD r1, r4
  LDI r2, 1
  ADD r1, r2
  STORE r4, r1
  LDI r4, 0x2008
  LDI r1, 15
  STORE r4, r1
  LDI r4, 0x2009
  LDI r1, 3
  STORE r4, r1
  LDI r20, 220
  LDI r21, 150
  BEEP r20, r21
  POP r31
  RET

; ── draw_frame: render game graphics ──────────
draw_frame:
  PUSH r31

  ; Clear screen
  LDI r1, 0x0A0A1A
  FILL r1

  ; Lane backgrounds (4 vertical strips)
  LDI r2, 0
  LDI r3, 40
  LDI r4, 256
  LDI r5, 0x1A1A3A
  LDI r1, 20
  RECTF r1, r2, r3, r4, r5
  LDI r1, 84
  RECTF r1, r2, r3, r4, r5
  LDI r1, 148
  RECTF r1, r2, r3, r4, r5
  LDI r1, 212
  RECTF r1, r2, r3, r4, r5

  ; Hit zone line at y=219
  LDI r1, 0
  LDI r2, 219
  LDI r3, 256
  LDI r4, 3
  LDI r5, 0x555555
  RECTF r1, r2, r3, r4, r5

  ; Draw notes (each lane)
  ; Lane 0: note rect at x=24, w=32, h=12
  LDI r4, 0x2100
  LOAD r10, r4
  JZ r10, dn0
  LDI r1, 24
  MOV r2, r10
  LDI r3, 32
  LDI r4, 12
  LDI r5, 0xFF00FF
  RECTF r1, r2, r3, r4, r5
dn0:
  ; Lane 1: note rect at x=88
  LDI r4, 0x2101
  LOAD r10, r4
  JZ r10, dn1
  LDI r1, 88
  MOV r2, r10
  LDI r3, 32
  LDI r4, 12
  LDI r5, 0xFF00FF
  RECTF r1, r2, r3, r4, r5
dn1:
  ; Lane 2: note rect at x=152
  LDI r4, 0x2102
  LOAD r10, r4
  JZ r10, dn2
  LDI r1, 152
  MOV r2, r10
  LDI r3, 32
  LDI r4, 12
  LDI r5, 0xFF00FF
  RECTF r1, r2, r3, r4, r5
dn2:
  ; Lane 3: note rect at x=216
  LDI r4, 0x2103
  LOAD r10, r4
  JZ r10, dn3
  LDI r1, 216
  MOV r2, r10
  LDI r3, 32
  LDI r4, 12
  LDI r5, 0xFF00FF
  RECTF r1, r2, r3, r4, r5
dn3:

  ; Score bar (green, width = score/100, clamped to 256)
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r2, 100
  DIV r1, r2
  JZ r1, nosbar
  LDI r2, 256
  CMP r1, r2
  BLT r0, sbok
  MOV r1, r2
sbok:
  MOV r3, r1
  LDI r1, 0
  LDI r2, 0
  LDI r4, 4
  LDI r5, 0x00FF00
  RECTF r1, r2, r3, r4, r5
nosbar:

  ; Combo bar (yellow, y=5, width = combo*10, clamped)
  LDI r4, 0x2001
  LOAD r1, r4
  JZ r1, nocbar
  LDI r2, 10
  MUL r1, r2
  LDI r2, 256
  CMP r1, r2
  BLT r0, cbok
  MOV r1, r2
cbok:
  MOV r3, r1
  LDI r1, 0
  LDI r2, 5
  LDI r4, 2
  LDI r5, 0xFFFF00
  RECTF r1, r2, r3, r4, r5
nocbar:

  ; Feedback flash in center
  LDI r4, 0x2008
  LOAD r1, r4
  JZ r1, nofb
  LDI r4, 0x2009
  LOAD r1, r4
  LDI r10, 100
  LDI r11, 120
  LDI r12, 56
  LDI r13, 20
  LDI r2, 1
  CMP r1, r2
  JNZ r0, fbnperf
  LDI r14, 0x00FF00
  JMP fbdraw
fbnperf:
  LDI r2, 2
  CMP r1, r2
  JNZ r0, fbngood
  LDI r14, 0xFFFF00
  JMP fbdraw
fbngood:
  LDI r14, 0xFF0000
fbdraw:
  RECTF r10, r11, r12, r13, r14
nofb:

  POP r31
  RET
