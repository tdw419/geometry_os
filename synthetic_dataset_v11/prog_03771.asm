; DESCRIPTION: Composite: . Then Sets a single purple pixel at (26, 73). Then Draws a green rectangle at (51, 110) with width 57 and height 53.
; PLAN: r0=26(x), r1=73(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=51(x), r1=110(y), r2=57(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (26, 73).
; PLAN: r0=26(x), r1=73(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 73
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a green rectangle at (51, 110) with width 57 and height 53.
; PLAN: r0=51(x), r1=110(y), r2=57(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 110
LDI r2, 57
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
