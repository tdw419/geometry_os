; DESCRIPTION: Composite: Draws a purple rectangle at (162, 122) with width 104 and height 47 then Places a orange circle of radius 16 at center (192, 167).
; PLAN: r0=162(x), r1=122(y), r2=104(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=167(y), r7=16(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 162
LDI r1, 122
LDI r2, 104
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 167
LDI r7, 16
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
