; DESCRIPTION: Composite: Renders a blue box of size 11x69 starting at (91, 133) then Sets a single yellow pixel at (240, 223) then Places a blue line segment connecting (158, 217) to (181, 185).
; PLAN: r0=91(x), r1=133(y), r2=11(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x), r6=223(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=158(x1), r11=217(y1), r12=181(x2), r13=185(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 133
LDI r2, 11
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 223
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 158
LDI r11, 217
LDI r12, 181
LDI r13, 185
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
