; DESCRIPTION: Composite: Creates a orange rectangular region at (349, 114) spanning 52 by 116 pixels then Sets a single blue pixel at (392, 72) then Places a purple line segment connecting (129, 250) to (292, 1).
; PLAN: r0=349(x), r1=114(y), r2=52(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x), r6=72(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=129(x1), r11=250(y1), r12=292(x2), r13=1(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 114
LDI r2, 52
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 72
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 129
LDI r11, 250
LDI r12, 292
LDI r13, 1
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
