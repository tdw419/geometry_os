; DESCRIPTION: Composite: Sets a single yellow pixel at (314, 254) then Draws a magenta line from (118, 96) to (500, 128) then Creates a purple rectangular region at (378, 180) spanning 19 by 76 pixels.
; PLAN: r0=314(x), r1=254(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=118(x1), r6=96(y1), r7=500(x2), r8=128(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=180(y), r12=19(width), r13=76(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 254
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 118
LDI r6, 96
LDI r7, 500
LDI r8, 128
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 180
LDI r12, 19
LDI r13, 76
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
