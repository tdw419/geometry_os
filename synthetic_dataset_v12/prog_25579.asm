; DESCRIPTION: Composite: Draws a orange line from (283, 72) to (316, 106) then Creates a purple circular shape at (258, 190) with radius 61 then Renders a blue box of size 64x79 starting at (363, 80).
; PLAN: r0=283(x1), r1=72(y1), r2=316(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=190(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=363(x), r11=80(y), r12=64(width), r13=79(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 72
LDI r2, 316
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 190
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 363
LDI r11, 80
LDI r12, 64
LDI r13, 79
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
