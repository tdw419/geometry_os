; DESCRIPTION: Composite: Draws a cyan rectangle at (26, 68) with width 45 and height 92 then Creates a purple circular shape at (306, 76) with radius 62.
; PLAN: r0=26(x), r1=68(y), r2=45(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=76(y), r7=62(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 26
LDI r1, 68
LDI r2, 45
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 76
LDI r7, 62
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
