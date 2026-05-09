; DESCRIPTION: Composite: Draws a red circle centered at (188, 22) with radius 15 then Renders a magenta box of size 99x51 starting at (35, 160) then Draws a orange line from (23, 207) to (250, 189).
; PLAN: r0=188(x), r1=22(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=160(y), r7=99(width), r8=51(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=23(x1), r11=207(y1), r12=250(x2), r13=189(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 188
LDI r1, 22
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 160
LDI r7, 99
LDI r8, 51
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 207
LDI r12, 250
LDI r13, 189
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
