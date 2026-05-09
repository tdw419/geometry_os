; DESCRIPTION: Composite: Draws a purple circle centered at (179, 127) with radius 64 then Places a yellow 23x88 rectangle at position (466, 18) then Draws a orange line from (222, 217) to (399, 0).
; PLAN: r0=179(x), r1=127(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=18(y), r7=23(width), r8=88(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=222(x1), r11=217(y1), r12=399(x2), r13=0(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 127
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 18
LDI r7, 23
LDI r8, 88
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 222
LDI r11, 217
LDI r12, 399
LDI r13, 0
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
