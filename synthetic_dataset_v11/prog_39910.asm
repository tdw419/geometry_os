; DESCRIPTION: Composite: . Then Places a cyan 107x111 rectangle at position (84, 53). Then Draws a blue circle centered at (127, 211) with radius 12.
; PLAN: r0=84(x), r1=53(y), r2=107(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=127(x), r1=211(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a cyan 107x111 rectangle at position (84, 53).
; PLAN: r0=84(x), r1=53(y), r2=107(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 53
LDI r2, 107
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (127, 211) with radius 12.
; PLAN: r0=127(x), r1=211(y), r2=12(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 211
LDI r2, 12
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
