; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (88, 89). Then Draws a yellow rectangle at (79, 178) with width 84 and height 13.
; PLAN: r0=88(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=79(x), r1=178(y), r2=84(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (88, 89).
; PLAN: r0=88(x), r1=89(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 89
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a yellow rectangle at (79, 178) with width 84 and height 13.
; PLAN: r0=79(x), r1=178(y), r2=84(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 178
LDI r2, 84
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
