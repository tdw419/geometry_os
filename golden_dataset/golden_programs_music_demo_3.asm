; DESCRIPTION: Draws a colored square at the screen with fixed size.

; music_demo.asm -- Simple melody with visual accompany
;
; Plays "Mary Had a Little Lamb" using square wave, with FRAME
; sync for visual bars showing each note's frequency.
;
; Melody: E4 D4 C4 D4 E4 E4 E4  D4 D4 D4  E4 G4 G4
;         E4 D4 C4 D4 E4 E4 E4 E4  D4 D4 E4 D4 C4
;
; Registers:
;   r12  = waveform (1 = square)
;   r10  = frequency (Hz)
;   r9  = duration (ms)
;   r6 = bar color
;   r20 = scratch

; ── constants ─────────────────────────────────────────────────────
#define WF_SQUARE 1
#define FREQ_C4 262
#define FREQ_D4 294
#define FREQ_E4 330
#define FREQ_G4 392
#define DUR_Q 400
#define DUR_H 800

; ── init ──────────────────────────────────────────────────────────
LDI r30, 0xFF00    ; stack pointer

; ── Melody: E D C D | E E E(h) | D D D(h) | E G G(h) ────────────

; Bar 1: E4 D4 C4 D4
  LDI r12, WF_SQUARE
  LDI r10, FREQ_E4
  LDI r9, DUR_Q
  LDI r6, 0x00FFFF
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_D4
  LDI r9, DUR_Q
  LDI r6, 0x00CCCC
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_C4
  LDI r9, DUR_Q
  LDI r6, 0x009999
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_D4
  LDI r9, DUR_Q
  LDI r6, 0x00CCCC
  FILL r6
  NOTE r12, r10, r9
  FRAME

; Bar 2: E4 E4 E4(half)
  LDI r10, FREQ_E4
  LDI r9, DUR_Q
  LDI r6, 0x00FFFF
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_E4
  LDI r9, DUR_Q
  NOTE r12, r10, r9
  FRAME

  LDI r9, DUR_H
  NOTE r12, r10, r9
  FRAME

; Bar 3: D4 D4 D4(half)
  LDI r10, FREQ_D4
  LDI r9, DUR_Q
  LDI r6, 0x00CCCC
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r9, DUR_Q
  NOTE r12, r10, r9
  FRAME

  LDI r9, DUR_H
  NOTE r12, r10, r9
  FRAME

; Bar 4: E4 G4 G4(half)
  LDI r10, FREQ_E4
  LDI r9, DUR_Q
  LDI r6, 0x00FFFF
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_G4
  LDI r9, DUR_Q
  LDI r6, 0x00FF99
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r9, DUR_H
  NOTE r12, r10, r9
  FRAME

; ── Melody part 2: E D C D | E E E E(h) | D D E D | C(h) ───────

; Bar 5: E4 D4 C4 D4
  LDI r10, FREQ_E4
  LDI r9, DUR_Q
  LDI r6, 0x00FFFF
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_D4
  LDI r9, DUR_Q
  LDI r6, 0x00CCCC
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_C4
  LDI r9, DUR_Q
  LDI r6, 0x009999
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_D4
  LDI r9, DUR_Q
  LDI r6, 0x00CCCC
  FILL r6
  NOTE r12, r10, r9
  FRAME

; Bar 6: E4 E4 E4 E4(half)
  LDI r10, FREQ_E4
  LDI r9, DUR_Q
  LDI r6, 0x00FFFF
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r9, DUR_Q
  NOTE r12, r10, r9
  FRAME

  LDI r9, DUR_Q
  NOTE r12, r10, r9
  FRAME

  LDI r9, DUR_H
  NOTE r12, r10, r9
  FRAME

; Bar 7: D4 D4 E4 D4
  LDI r10, FREQ_D4
  LDI r9, DUR_Q
  LDI r6, 0x00CCCC
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r9, DUR_Q
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_E4
  LDI r9, DUR_Q
  LDI r6, 0x00FFFF
  FILL r6
  NOTE r12, r10, r9
  FRAME

  LDI r10, FREQ_D4
  LDI r9, DUR_Q
  LDI r6, 0x00CCCC
  FILL r6
  NOTE r12, r10, r9
  FRAME

; Bar 8: C4(half) -- final note
  LDI r10, FREQ_C4
  LDI r9, DUR_H
  LDI r6, 0x009999
  FILL r6
  NOTE r12, r10, r9
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r6, 0
  FILL r6
  HALT
