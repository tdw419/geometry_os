; DESCRIPTION: Composite: Draws a orange circle centered at (95, 85) with radius 36 then Draws a red rectangle at (8, 101) with width 23 and height 112 then Places a orange line segment connecting (263, 51) to (345, 162).
; PLAN: r0=95(x), r1=85(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=101(y), r7=23(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=263(x1), r11=51(y1), r12=345(x2), r13=162(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 85
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 101
LDI r7, 23
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 51
LDI r12, 345
LDI r13, 162
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
