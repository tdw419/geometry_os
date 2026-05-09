; DESCRIPTION: Composite: Draws a cyan rectangle at (104, 2) with width 96 and height 41 then Places a purple circle of radius 20 at center (26, 95).
; PLAN: r0=104(x), r1=2(y), r2=96(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=95(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 104
LDI r1, 2
LDI r2, 96
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 95
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
