; DESCRIPTION: Composite: . Then Sets a single green pixel at (125, 60). Then Draws a magenta rectangle at (133, 61) with width 56 and height 67.
; PLAN: r0=125(x), r1=60(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=133(x), r1=61(y), r2=56(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (125, 60).
; PLAN: r0=125(x), r1=60(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 125
LDI r1, 60
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (133, 61) with width 56 and height 67.
; PLAN: r0=133(x), r1=61(y), r2=56(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 61
LDI r2, 56
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
