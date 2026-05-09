; DESCRIPTION: Composite: . Then Sets a single purple pixel at (111, 122). Then Draws a orange rectangle at (119, 1) with width 104 and height 106.
; PLAN: r0=111(x), r1=122(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=119(x), r1=1(y), r2=104(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (111, 122).
; PLAN: r0=111(x), r1=122(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 122
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange rectangle at (119, 1) with width 104 and height 106.
; PLAN: r0=119(x), r1=1(y), r2=104(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 1
LDI r2, 104
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
