; DESCRIPTION: Composite: Draws a green rectangle at (166, 117) with width 49 and height 60 then Sets a single blue pixel at (53, 77).
; PLAN: r0=166(x), r1=117(y), r2=49(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x), r6=77(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 166
LDI r1, 117
LDI r2, 49
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 77
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
