; DESCRIPTION: Composite: Draws a yellow rectangle at (185, 123) with width 53 and height 23 then Places a purple circle of radius 19 at center (88, 219).
; PLAN: r0=185(x), r1=123(y), r2=53(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=219(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 123
LDI r2, 53
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 219
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
