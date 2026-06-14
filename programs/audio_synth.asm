; audio_synth.asm -- Interactive Musical Keyboard Synthesizer
; Phase 438: GeOS Program -- Audio Synthesizer
;
; Renders a C4-C5 piano keyboard and plays notes via NOTE opcode
; when keys are pressed. Highlights active keys with a green glow.
;
; Keyboard mapping (PC keyboard as piano):
;   White keys (lower row): Z=C4, X=D4, C=E4, V=F4, B=G4, N=A4, M=B4, comma=C5
;   Black keys (upper row): S=C#4, D=D#4, G=F#4, H=G#4, J=A#4
;
; Register convention:
;   r1  = NOTE waveform (1 = square, constant)
;   r10 = IKEY result / scratch / note index
;   r11 = scratch
;   r12 = scratch / highlight timer
;   r13 = scratch / highlight key index memory addr
;   r30 = stack pointer
;   r31 = link register

; ── Init ──────────────────────────────────────────────────────────
init:
  LDI r30, 0xFF00          ; stack pointer

  ; Init highlight state
  LDI r13, 0x2000          ; highlighted note index (0xFF=none)
  LDI r10, 0xFF
  STORE r13, r10           ; no highlighted note
  LDI r13, 0x2001          ; highlight timer (frames remaining)
  LDI r10, 0
  STORE r13, r10           ; timer = 0

  ; Draw the keyboard once
  CALL draw_white_keys
  CALL draw_black_keys

; ── Main Loop ─────────────────────────────────────────────────────
main_loop:
  ; Read a key from the ring buffer
  IKEY r10                 ; r10 = ASCII key code, 0 if none
  JZ r10, check_hl         ; no key pressed

  ; Find the note index for this key
  PUSH r31
  CALL find_note            ; r10 = note index (0-12) or 0xFF
  POP r31

  ; If it's a valid note, play it and highlight
  CMPI r10, 0xFF
  JZ r0, check_hl           ; not a note key

  ; Save the note index for highlight tracking
  LDI r13, 0x2000
  STORE r13, r10            ; store highlighted note

  ; Highlight the key
  PUSH r31
  CALL highlight_note       ; highlights key at index r10
  POP r31

  ; Play the note (square wave, 200ms)
  PUSH r31
  CALL play_note            ; plays note at index r10
  POP r31

  ; Set highlight timer to 6 frames
  LDI r13, 0x2001
  LDI r10, 6
  STORE r13, r10

check_hl:
  ; Decrement highlight timer if active
  LDI r13, 0x2001
  LOAD r10, r13             ; r10 = timer
  JZ r10, after_hl          ; no timer active

  LDI r11, 1
  SUB r10, r11              ; timer -= 1
  STORE r13, r10            ; store decremented timer
  JNZ r10, after_hl         ; still active

  ; Timer expired -- restore key color
  PUSH r31
  CALL restore_key
  POP r31

after_hl:
  FRAME
  JMP main_loop

; ── draw_white_keys ───────────────────────────────────────────────
; Draw 8 white piano keys (C4 through C5) at the bottom of the screen.
; Each key = 30px wide x 42px tall, starting at y=214.
draw_white_keys:
  PUSH r31
  PUSH r10
  PUSH r11
  PUSH r12
  PUSH r13
  PUSH r14

  LDI r10, 214              ; y position (all white keys same y)
  LDI r11, 30               ; width
  LDI r12, 42               ; height

  ; Key 0 (C4): x=8, white
  LDI r13, 8
  LDI r14, 0xFFFFFF         ; white
  RECTF r13, r10, r11, r12, r14

  ; Key 1 (D4): x=38
  LDI r13, 38
  RECTF r13, r10, r11, r12, r14

  ; Key 2 (E4): x=68
  LDI r13, 68
  RECTF r13, r10, r11, r12, r14

  ; Key 3 (F4): x=98
  LDI r13, 98
  RECTF r13, r10, r11, r12, r14

  ; Key 4 (G4): x=128
  LDI r13, 128
  RECTF r13, r10, r11, r12, r14

  ; Key 5 (A4): x=158
  LDI r13, 158
  RECTF r13, r10, r11, r12, r14

  ; Key 6 (B4): x=188
  LDI r13, 188
  RECTF r13, r10, r11, r12, r14

  ; Key 7 (C5): x=218
  LDI r13, 218
  RECTF r13, r10, r11, r12, r14

  POP r14
  POP r13
  POP r12
  POP r11
  POP r10
  POP r31
  RET

; ── draw_black_keys ───────────────────────────────────────────────
; Draw 5 black keys (C#4, D#4, F#4, G#4, A#4) above white keys.
; Each = 18px wide x 28px tall, starting at y=186.
draw_black_keys:
  PUSH r31
  PUSH r10
  PUSH r11
  PUSH r12
  PUSH r13
  PUSH r14

  LDI r10, 186              ; y position
  LDI r11, 18               ; width
  LDI r12, 28               ; height

  ; Distinguish black keys from white with darker color
  LDI r14, 0x222222         ; dark charcoal

  ; Black key 0 (C#4): x=29 (between C and D)
  LDI r13, 29
  RECTF r13, r10, r11, r12, r14

  ; Black key 1 (D#4): x=59 (between D and E)
  LDI r13, 59
  RECTF r13, r10, r11, r12, r14

  ; Black key 2 (F#4): x=119 (between F and G)
  LDI r13, 119
  RECTF r13, r10, r11, r12, r14

  ; Black key 3 (G#4): x=149 (between G and A)
  LDI r13, 149
  RECTF r13, r10, r11, r12, r14

  ; Black key 4 (A#4): x=179 (between A and B)
  LDI r13, 179
  RECTF r13, r10, r11, r12, r14

  POP r14
  POP r13
  POP r12
  POP r11
  POP r10
  POP r31
  RET

; ── find_note ─────────────────────────────────────────────────────
; Map ASCII key code (r10) to note index (0-12).
; Returns: r10 = note index, or 0xFF if not a note key.
find_note:
  PUSH r31
  PUSH r11

  ; --- White keys (lower row) ---
  ; Z = 0x5A = 90 -> C4 (0)
  CMPI r10, 90
  JZ r0, fn_c4

  ; X = 0x58 = 88 -> D4 (2)
  CMPI r10, 88
  JZ r0, fn_d4

  ; C = 0x43 = 67 -> E4 (4)
  CMPI r10, 67
  JZ r0, fn_e4

  ; V = 0x56 = 86 -> F4 (5)
  CMPI r10, 86
  JZ r0, fn_f4

  ; B = 0x42 = 66 -> G4 (7)
  CMPI r10, 66
  JZ r0, fn_g4

  ; N = 0x4E = 78 -> A4 (9)
  CMPI r10, 78
  JZ r0, fn_a4

  ; M = 0x4D = 77 -> B4 (11)
  CMPI r10, 77
  JZ r0, fn_b4

  ; , = 0x2C = 44 -> C5 (12)
  CMPI r10, 44
  JZ r0, fn_c5

  ; --- Black keys (upper row) ---
  ; S = 0x53 = 83 -> C#4 (1)
  CMPI r10, 83
  JZ r0, fn_cs4

  ; D = 0x44 = 68 -> D#4 (3)
  CMPI r10, 68
  JZ r0, fn_ds4

  ; G = 0x47 = 71 -> F#4 (6)
  CMPI r10, 71
  JZ r0, fn_fs4

  ; H = 0x48 = 72 -> G#4 (8)
  CMPI r10, 72
  JZ r0, fn_gs4

  ; J = 0x4A = 74 -> A#4 (10)
  CMPI r10, 74
  JZ r0, fn_as4

  ; No match
  LDI r10, 0xFF
  JMP fn_done

fn_c4:   LDI r10, 0;   JMP fn_done
fn_cs4:  LDI r10, 1;   JMP fn_done
fn_d4:   LDI r10, 2;   JMP fn_done
fn_ds4:  LDI r10, 3;   JMP fn_done
fn_e4:   LDI r10, 4;   JMP fn_done
fn_f4:   LDI r10, 5;   JMP fn_done
fn_fs4:  LDI r10, 6;   JMP fn_done
fn_g4:   LDI r10, 7;   JMP fn_done
fn_gs4:  LDI r10, 8;   JMP fn_done
fn_a4:   LDI r10, 9;   JMP fn_done
fn_as4:  LDI r10, 10;  JMP fn_done
fn_b4:   LDI r10, 11;  JMP fn_done
fn_c5:   LDI r10, 12

fn_done:
  POP r11
  POP r31
  RET

; ── play_note ─────────────────────────────────────────────────────
; Play a note at index r10 (0-12) via NOTE opcode.
; Uses square wave (1), duration 200ms.
play_note:
  PUSH r31
  PUSH r11

  LDI r1, 1                 ; square wave
  LDI r3, 200               ; 200ms

  ; Branch to correct frequency based on index
  CMPI r10, 0
  JZ r0, pn_c4
  CMPI r10, 1
  JZ r0, pn_cs4
  CMPI r10, 2
  JZ r0, pn_d4
  CMPI r10, 3
  JZ r0, pn_ds4
  CMPI r10, 4
  JZ r0, pn_e4
  CMPI r10, 5
  JZ r0, pn_f4
  CMPI r10, 6
  JZ r0, pn_fs4
  CMPI r10, 7
  JZ r0, pn_g4
  CMPI r10, 8
  JZ r0, pn_gs4
  CMPI r10, 9
  JZ r0, pn_a4
  CMPI r10, 10
  JZ r0, pn_as4
  CMPI r10, 11
  JZ r0, pn_b4
  ; Index 12 = C5
  JMP pn_c5

pn_c4:   LDI r2, 262;  JMP pn_play
pn_cs4:  LDI r2, 277;  JMP pn_play
pn_d4:   LDI r2, 294;  JMP pn_play
pn_ds4:  LDI r2, 311;  JMP pn_play
pn_e4:   LDI r2, 330;  JMP pn_play
pn_f4:   LDI r2, 349;  JMP pn_play
pn_fs4:  LDI r2, 370;  JMP pn_play
pn_g4:   LDI r2, 392;  JMP pn_play
pn_gs4:  LDI r2, 415;  JMP pn_play
pn_a4:   LDI r2, 440;  JMP pn_play
pn_as4:  LDI r2, 466;  JMP pn_play
pn_b4:   LDI r2, 494;  JMP pn_play
pn_c5:   LDI r2, 523

pn_play:
  NOTE r1, r2, r3

  POP r11
  POP r31
  RET

; ── highlight_note ────────────────────────────────────────────────
; Highlight a piano key by note index r10 (0-12).
; Draws a green rectangle over the key.
highlight_note:
  PUSH r31
  PUSH r11
  PUSH r12
  PUSH r13

  ; White key positions: x = 8 + index * 30 for white keys
  ; But black keys are between some white keys, so we need
  ; to map note indices to key positions:
  ;
  ;   Index  Key    Type   x
  ;   0      C4     white  8
  ;   1      C#4    black  29
  ;   2      D4     white  38
  ;   3      D#4    black  59
  ;   4      E4     white  68
  ;   5      F4     white  98
  ;   6      F#4    black  119
  ;   7      G4     white  128
  ;   8      G#4    black  149
  ;   9      A4     white  158
  ;   10     A#4    black  179
  ;   11     B4     white  188
  ;   12     C5     white  218

  ; Branch by index
  CMPI r10, 0;   JZ r0, hl_0
  CMPI r10, 1;   JZ r0, hl_1
  CMPI r10, 2;   JZ r0, hl_2
  CMPI r10, 3;   JZ r0, hl_3
  CMPI r10, 4;   JZ r0, hl_4
  CMPI r10, 5;   JZ r0, hl_5
  CMPI r10, 6;   JZ r0, hl_6
  CMPI r10, 7;   JZ r0, hl_7
  CMPI r10, 8;   JZ r0, hl_8
  CMPI r10, 9;   JZ r0, hl_9
  CMPI r10, 10;  JZ r0, hl_10
  CMPI r10, 11;  JZ r0, hl_11
  JMP hl_12

hl_0:   LDI r11, 8;    LDI r12, 30;  LDI r13, 214;  JMP hl_draw
hl_1:   LDI r11, 29;   LDI r12, 18;  LDI r13, 186;  JMP hl_draw
hl_2:   LDI r11, 38;   LDI r12, 30;  LDI r13, 214;  JMP hl_draw
hl_3:   LDI r11, 59;   LDI r12, 18;  LDI r13, 186;  JMP hl_draw
hl_4:   LDI r11, 68;   LDI r12, 30;  LDI r13, 214;  JMP hl_draw
hl_5:   LDI r11, 98;   LDI r12, 30;  LDI r13, 214;  JMP hl_draw
hl_6:   LDI r11, 119;  LDI r12, 18;  LDI r13, 186;  JMP hl_draw
hl_7:   LDI r11, 128;  LDI r12, 30;  LDI r13, 214;  JMP hl_draw
hl_8:   LDI r11, 149;  LDI r12, 18;  LDI r13, 186;  JMP hl_draw
hl_9:   LDI r11, 158;  LDI r12, 30;  LDI r13, 214;  JMP hl_draw
hl_10:  LDI r11, 179;  LDI r12, 18;  LDI r13, 186;  JMP hl_draw
hl_11:  LDI r11, 188;  LDI r12, 30;  LDI r13, 214;  JMP hl_draw
hl_12:  LDI r11, 218;  LDI r12, 30;  LDI r13, 214

hl_draw:
  ; r11=x, r12=w, r13=y, h=42 (white) or 28 (black)
  ; Determine height from y position
  PUSH r10
  PUSH r14
  LDI r10, 214
  CMP r13, r10               ; r0 = -1 if < 214 (black key), 0 if = 214 (white key)
  BLT r0, hl_black

  ; White key height = 42
  LDI r10, 42
  LDI r14, 0x00FF88         ; green glow
  RECTF r11, r13, r12, r10, r14
  POP r14
  POP r10
  POP r13
  POP r12
  POP r11
  POP r31
  RET

hl_black:
  ; Black key height = 28
  LDI r10, 28
  LDI r14, 0x00CC66         ; darker green for black keys
  RECTF r11, r13, r12, r10, r14
  POP r14
  POP r10
  POP r13
  POP r12
  POP r11
  POP r31
  RET

; ── restore_key ───────────────────────────────────────────────────
; Restore the highlighted key to its normal color.
restore_key:
  PUSH r31
  PUSH r10
  PUSH r11
  PUSH r12
  PUSH r13

  ; Read the currently highlighted note index
  LDI r13, 0x2000
  LOAD r10, r13              ; r10 = note index
  CMPI r10, 0xFF
  JZ r0, rst_done            ; nothing to restore

  ; Branch by index to redraw in normal color
  CMPI r10, 0;   JZ r0, rst_0
  CMPI r10, 1;   JZ r0, rst_1
  CMPI r10, 2;   JZ r0, rst_2
  CMPI r10, 3;   JZ r0, rst_3
  CMPI r10, 4;   JZ r0, rst_4
  CMPI r10, 5;   JZ r0, rst_5
  CMPI r10, 6;   JZ r0, rst_6
  CMPI r10, 7;   JZ r0, rst_7
  CMPI r10, 8;   JZ r0, rst_8
  CMPI r10, 9;   JZ r0, rst_9
  CMPI r10, 10;  JZ r0, rst_10
  CMPI r10, 11;  JZ r0, rst_11
  JMP rst_12

rst_0:   LDI r11, 8;    LDI r12, 30;  LDI r13, 214;  LDI r14, 0xFFFFFF;  JMP rst_draw
rst_1:   LDI r11, 29;   LDI r12, 18;  LDI r13, 186;  LDI r14, 0x222222;  JMP rst_draw
rst_2:   LDI r11, 38;   LDI r12, 30;  LDI r13, 214;  LDI r14, 0xFFFFFF;  JMP rst_draw
rst_3:   LDI r11, 59;   LDI r12, 18;  LDI r13, 186;  LDI r14, 0x222222;  JMP rst_draw
rst_4:   LDI r11, 68;   LDI r12, 30;  LDI r13, 214;  LDI r14, 0xFFFFFF;  JMP rst_draw
rst_5:   LDI r11, 98;   LDI r12, 30;  LDI r13, 214;  LDI r14, 0xFFFFFF;  JMP rst_draw
rst_6:   LDI r11, 119;  LDI r12, 18;  LDI r13, 186;  LDI r14, 0x222222;  JMP rst_draw
rst_7:   LDI r11, 128;  LDI r12, 30;  LDI r13, 214;  LDI r14, 0xFFFFFF;  JMP rst_draw
rst_8:   LDI r11, 149;  LDI r12, 18;  LDI r13, 186;  LDI r14, 0x222222;  JMP rst_draw
rst_9:   LDI r11, 158;  LDI r12, 30;  LDI r13, 214;  LDI r14, 0xFFFFFF;  JMP rst_draw
rst_10:  LDI r11, 179;  LDI r12, 18;  LDI r13, 186;  LDI r14, 0x222222;  JMP rst_draw
rst_11:  LDI r11, 188;  LDI r12, 30;  LDI r13, 214;  LDI r14, 0xFFFFFF;  JMP rst_draw
rst_12:  LDI r11, 218;  LDI r12, 30;  LDI r13, 214;  LDI r14, 0xFFFFFF

rst_draw:
  ; r11=x, r12=w, r13=y, r14=color
  ; Determine height from y
  PUSH r10
  LDI r10, 214
  CMP r13, r10
  BLT r0, rst_black_key

  ; White key
  LDI r10, 42
  RECTF r11, r13, r12, r10, r14
  POP r10
  JMP rst_done

rst_black_key:
  LDI r10, 28
  RECTF r11, r13, r12, r10, r14
  POP r10

rst_done:
  ; Clear highlighted note index
  LDI r13, 0x2000
  LDI r10, 0xFF
  STORE r13, r10

  POP r13
  POP r12
  POP r11
  POP r10
  POP r31
  RET
