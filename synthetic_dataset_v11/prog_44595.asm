; DESCRIPTION: Composite: . Then Draws a magenta circle centered at (98, 131) with radius 71. Then Places a orange 19x54 rectangle at position (125, 75).
; PLAN: r0=98(x), r1=131(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=125(x), r1=75(y), r2=19(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a magenta circle centered at (98, 131) with radius 71.
; PLAN: r0=98(x), r1=131(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 131
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange 19x54 rectangle at position (125, 75).
; PLAN: r0=125(x), r1=75(y), r2=19(width), r3=54(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 75
LDI r2, 19
LDI r3, 54
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
