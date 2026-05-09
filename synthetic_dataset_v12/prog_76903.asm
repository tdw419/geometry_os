; DESCRIPTION: Composite: Creates a black rectangular region at (347, 126) spanning 91 by 15 pixels then Sets a single black pixel at (459, 113) then Draws a purple line from (489, 66) to (57, 250).
; PLAN: r0=347(x), r1=126(y), r2=91(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=459(x), r6=113(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=489(x1), r11=66(y1), r12=57(x2), r13=250(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 126
LDI r2, 91
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 113
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 489
LDI r11, 66
LDI r12, 57
LDI r13, 250
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
