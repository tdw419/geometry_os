; DESCRIPTION: Composite: . Then Draws a orange rectangle at (95, 26) with width 49 and height 88. Then Sets a single yellow pixel at (165, 5).
; PLAN: r0=95(x), r1=26(y), r2=49(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=165(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a orange rectangle at (95, 26) with width 49 and height 88.
; PLAN: r0=95(x), r1=26(y), r2=49(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 26
LDI r2, 49
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (165, 5).
; PLAN: r0=165(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 165
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
