; DESCRIPTION: Composite: Draws a yellow line from (316, 175) to (56, 170) then Sets a single yellow pixel at (300, 113) then Renders a blue disk with center (278, 114) and radius 47.
; PLAN: r0=316(x1), r1=175(y1), r2=56(x2), r3=170(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=113(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=278(x), r11=114(y), r12=47(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 316
LDI r1, 175
LDI r2, 56
LDI r3, 170
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 113
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 278
LDI r11, 114
LDI r12, 47
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
