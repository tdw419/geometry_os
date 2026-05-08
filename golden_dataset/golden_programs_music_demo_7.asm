; DESCRIPTION: Render a colored square at the screen.

; music_demo.asm -- Simple melody with visual accompany
;
; Plays "Mary Had a Little Lamb" using square wave, with FRAME
; sync for visual bars showing each note's frequency.
;
; Melody: E4 D4 C4 D4 E4 E4 E4  D4 D4 D4  E4 G4 G4
;         E4 D4 C4 D4 E4 E4 E4 E4  D4 D4 E4 D4 C4
;
; Registers:
;   r0  = waveform (1 = square)
;   r15  = frequency (Hz)
;   r9  = duration (ms)
;   r8 = bar color
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
  LDI r0, WF_SQUARE
  LDI r15, FREQ_E4
  LDI r9, DUR_Q
  LDI r8, 0x00FFFF
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_D4
  LDI r9, DUR_Q
  LDI r8, 0x00CCCC
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_C4
  LDI r9, DUR_Q
  LDI r8, 0x009999
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_D4
  LDI r9, DUR_Q
  LDI r8, 0x00CCCC
  FILL r8
  NOTE r0, r15, r9
  FRAME

; Bar 2: E4 E4 E4(half)
  LDI r15, FREQ_E4
  LDI r9, DUR_Q
  LDI r8, 0x00FFFF
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_E4
  LDI r9, DUR_Q
  NOTE r0, r15, r9
  FRAME

  LDI r9, DUR_H
  NOTE r0, r15, r9
  FRAME

; Bar 3: D4 D4 D4(half)
  LDI r15, FREQ_D4
  LDI r9, DUR_Q
  LDI r8, 0x00CCCC
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r9, DUR_Q
  NOTE r0, r15, r9
  FRAME

  LDI r9, DUR_H
  NOTE r0, r15, r9
  FRAME

; Bar 4: E4 G4 G4(half)
  LDI r15, FREQ_E4
  LDI r9, DUR_Q
  LDI r8, 0x00FFFF
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_G4
  LDI r9, DUR_Q
  LDI r8, 0x00FF99
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r9, DUR_H
  NOTE r0, r15, r9
  FRAME

; ── Melody part 2: E D C D | E E E E(h) | D D E D | C(h) ───────

; Bar 5: E4 D4 C4 D4
  LDI r15, FREQ_E4
  LDI r9, DUR_Q
  LDI r8, 0x00FFFF
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_D4
  LDI r9, DUR_Q
  LDI r8, 0x00CCCC
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_C4
  LDI r9, DUR_Q
  LDI r8, 0x009999
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_D4
  LDI r9, DUR_Q
  LDI r8, 0x00CCCC
  FILL r8
  NOTE r0, r15, r9
  FRAME

; Bar 6: E4 E4 E4 E4(half)
  LDI r15, FREQ_E4
  LDI r9, DUR_Q
  LDI r8, 0x00FFFF
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r9, DUR_Q
  NOTE r0, r15, r9
  FRAME

  LDI r9, DUR_Q
  NOTE r0, r15, r9
  FRAME

  LDI r9, DUR_H
  NOTE r0, r15, r9
  FRAME

; Bar 7: D4 D4 E4 D4
  LDI r15, FREQ_D4
  LDI r9, DUR_Q
  LDI r8, 0x00CCCC
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r9, DUR_Q
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_E4
  LDI r9, DUR_Q
  LDI r8, 0x00FFFF
  FILL r8
  NOTE r0, r15, r9
  FRAME

  LDI r15, FREQ_D4
  LDI r9, DUR_Q
  LDI r8, 0x00CCCC
  FILL r8
  NOTE r0, r15, r9
  FRAME

; Bar 8: C4(half) -- final note
  LDI r15, FREQ_C4
  LDI r9, DUR_H
  LDI r8, 0x009999
  FILL r8
  NOTE r0, r15, r9
  FRAME

; ── done ────────────────────────────────────────────────────────
  LDI r8, 0
  FILL r8
  HALT
