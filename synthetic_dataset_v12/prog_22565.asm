; DESCRIPTION: Composite: Draws a blue circle centered at (430, 163) with radius 73 then Places a black 15x88 rectangle at position (76, 2).
; PLAN: r0=430(x), r1=163(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x), r6=2(y), r7=15(width), r8=88(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 430
LDI r1, 163
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 2
LDI r7, 15
LDI r8, 88
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
