; DESCRIPTION: Composite: Draws a purple rectangle at (6, 12) with width 41 and height 49 then Places a cyan circle of radius 22 at center (253, 116).
; PLAN: r0=6(x), r1=12(y), r2=41(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=116(y), r7=22(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 6
LDI r1, 12
LDI r2, 41
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 116
LDI r7, 22
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
