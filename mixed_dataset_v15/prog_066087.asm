; DESCRIPTION: Composite: Places a black line segment connecting (288, 158) to (336, 141) then Draws a orange rectangle at (25, 128) with width 53 and height 31 then Sets a single blue pixel at (258, 37).
; PLAN: r0=288(x1), r1=158(y1), r2=336(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=128(y), r7=53(width), r8=31(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=258(x), r11=37(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 158
LDI r2, 336
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 128
LDI r7, 53
LDI r8, 31
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 37
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
