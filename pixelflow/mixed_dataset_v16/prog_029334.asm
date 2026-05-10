; DESCRIPTION: Composite: Draws a black rectangle at (244, 164) with width 83 and height 92 then Creates a red circular shape at (490, 142) with radius 11.
; PLAN: r0=244(x), r1=164(y), r2=83(width), r3=92(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x), r6=142(y), r7=11(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 244
LDI r1, 164
LDI r2, 83
LDI r3, 92
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 142
LDI r7, 11
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
