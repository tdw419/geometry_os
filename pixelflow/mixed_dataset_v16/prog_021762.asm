; DESCRIPTION: Composite: Places a purple circle of radius 79 at center (379, 132) then Renders a purple box of size 63x44 starting at (18, 198) then Places a yellow line segment connecting (246, 229) to (145, 78).
; PLAN: r0=379(x), r1=132(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x), r6=198(y), r7=63(width), r8=44(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=246(x1), r11=229(y1), r12=145(x2), r13=78(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 379
LDI r1, 132
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 198
LDI r7, 63
LDI r8, 44
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 229
LDI r12, 145
LDI r13, 78
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
