; DESCRIPTION: Composite: Draws a red rectangle at (366, 56) with width 89 and height 76 then Draws a purple circle centered at (286, 102) with radius 75.
; PLAN: r0=366(x), r1=56(y), r2=89(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=102(y), r7=75(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 366
LDI r1, 56
LDI r2, 89
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 102
LDI r7, 75
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
