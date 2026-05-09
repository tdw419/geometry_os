; MATRIX RAIN -- Digital rain effect with vertical green streaks
; Dark background with 40 vertical rain drops of varying brightness
; Uses LINE for streaks and PSET for bright heads

; Fill background dark
LDI r0, 0x000A0A
FILL r0

; Drop counter
LDI r0, 0            ; r0 = counter (0..39)
LDI r1, 1            ; increment
LDI r2, 40           ; total drops

loop:
  ; x = counter * 6 + 5  (range: 5..239)
  LDI r3, 0
  ADD r3, r0
  LDI r4, 6
  MUL r3, r4
  LDI r4, 5
  ADD r3, r4         ; r3 = x

  ; y_start = counter * 5 + 10  (range: 10..205)
  LDI r4, 0
  ADD r4, r0
  LDI r5, 5
  MUL r4, r5
  LDI r5, 10
  ADD r4, r5         ; r4 = y_start

  ; y_end = y_start + 30
  LDI r5, 0
  ADD r5, r4
  LDI r6, 30
  ADD r5, r6         ; r5 = y_end

  ; Color: alternate between two greens
  LDI r7, 0x00FF00   ; bright green
  LDI r8, 0
  ADD r8, r0
  LDI r9, 1
  AND r8, r9         ; r8 = counter & 1
  JZ r8, draw_streak
  LDI r7, 0x00CC44   ; alt green

draw_streak:
  ; Draw main streak
  LINE r3, r4, r3, r5, r7

  ; Draw bright head pixel at bottom of streak
  LDI r7, 0x88FFAA
  PSET r3, r5, r7

  ; Draw dimmer tail pixel at top
  LDI r7, 0x004400
  PSET r3, r4, r7

  ; Next drop
  ADD r0, r1
  LDI r5, 0
  ADD r5, r0
  SUB r5, r2
  JNZ r5, loop

HALT
