; DESCRIPTION: Composite: Sets a single yellow pixel at (397, 210) then Draws a purple rectangle at (454, 39) with width 45 and height 101 then Places a orange line segment connecting (285, 175) to (254, 184).
; PLAN: r0=397(x), r1=210(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=39(y), r7=45(width), r8=101(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=285(x1), r11=175(y1), r12=254(x2), r13=184(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 210
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 454
LDI r6, 39
LDI r7, 45
LDI r8, 101
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 175
LDI r12, 254
LDI r13, 184
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
