; DESCRIPTION: Composite: Draws a black rectangle at (39, 191) with width 101 and height 53 then Places a orange line segment connecting (275, 175) to (476, 43).
; PLAN: r0=39(x), r1=191(y), r2=101(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x1), r6=175(y1), r7=476(x2), r8=43(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 191
LDI r2, 101
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 175
LDI r7, 476
LDI r8, 43
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
