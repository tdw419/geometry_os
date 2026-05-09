; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (15, 178). Then Draws a purple rectangle at (17, 210) with width 87 and height 13.
; PLAN: r0=15(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=17(x), r1=210(y), r2=87(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (15, 178).
; PLAN: r0=15(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 178
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a purple rectangle at (17, 210) with width 87 and height 13.
; PLAN: r0=17(x), r1=210(y), r2=87(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 210
LDI r2, 87
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
