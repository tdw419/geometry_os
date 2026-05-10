; DESCRIPTION: Composite: Places a black line segment connecting (70, 136) to (36, 34) then Sets a single yellow pixel at (423, 228) then Creates a blue rectangular region at (65, 127) spanning 14 by 118 pixels.
; PLAN: r0=70(x1), r1=136(y1), r2=36(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=228(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=65(x), r11=127(y), r12=14(width), r13=118(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 136
LDI r2, 36
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 228
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 65
LDI r11, 127
LDI r12, 14
LDI r13, 118
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
