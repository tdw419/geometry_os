; DESCRIPTION: Composite: Creates a black rectangular region at (352, 56) spanning 22 by 55 pixels then Sets a single orange pixel at (367, 59) then Draws a purple line from (172, 96) to (389, 182).
; PLAN: r0=352(x), r1=56(y), r2=22(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=59(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=172(x1), r11=96(y1), r12=389(x2), r13=182(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 352
LDI r1, 56
LDI r2, 22
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 59
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 172
LDI r11, 96
LDI r12, 389
LDI r13, 182
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
