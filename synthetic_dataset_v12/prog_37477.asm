; DESCRIPTION: Composite: Renders a white line between points (366, 14) and (369, 74) then Renders a magenta box of size 16x78 starting at (254, 72) then Renders a yellow disk with center (227, 193) and radius 51.
; PLAN: r0=366(x1), r1=14(y1), r2=369(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=72(y), r7=16(width), r8=78(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=227(x), r11=193(y), r12=51(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 366
LDI r1, 14
LDI r2, 369
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 72
LDI r7, 16
LDI r8, 78
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 227
LDI r11, 193
LDI r12, 51
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
