; DESCRIPTION: Composite: Renders a magenta disk with center (348, 84) and radius 51 then Creates a blue rectangular region at (391, 66) spanning 21 by 101 pixels then Draws a blue line from (325, 65) to (141, 215).
; PLAN: r0=348(x), r1=84(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=66(y), r7=21(width), r8=101(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x1), r11=65(y1), r12=141(x2), r13=215(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 84
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 66
LDI r7, 21
LDI r8, 101
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 65
LDI r12, 141
LDI r13, 215
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
