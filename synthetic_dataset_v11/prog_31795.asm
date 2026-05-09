; DESCRIPTION: Composite: . Then Places a orange dot at position (165, 132). Then Draws a magenta rectangle at (60, 17) with width 81 and height 49.
; PLAN: r0=165(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=60(x), r1=17(y), r2=81(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange dot at position (165, 132).
; PLAN: r0=165(x), r1=132(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 132
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Draws a magenta rectangle at (60, 17) with width 81 and height 49.
; PLAN: r0=60(x), r1=17(y), r2=81(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 17
LDI r2, 81
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
