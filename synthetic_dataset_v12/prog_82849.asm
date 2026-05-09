; DESCRIPTION: Composite: Places a blue line segment connecting (432, 218) to (361, 30) then Draws a red circle centered at (241, 106) with radius 26 then Places a cyan 73x119 rectangle at position (324, 98).
; PLAN: r0=432(x1), r1=218(y1), r2=361(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=106(y), r7=26(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=324(x), r11=98(y), r12=73(width), r13=119(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 218
LDI r2, 361
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 106
LDI r7, 26
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 324
LDI r11, 98
LDI r12, 73
LDI r13, 119
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
