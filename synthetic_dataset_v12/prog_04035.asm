; DESCRIPTION: Composite: Places a red circle of radius 26 at center (171, 31) then Sets a single purple pixel at (23, 137) then Draws a purple line from (498, 162) to (428, 152).
; PLAN: r0=171(x), r1=31(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=23(x), r6=137(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=498(x1), r11=162(y1), r12=428(x2), r13=152(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 31
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 23
LDI r6, 137
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 498
LDI r11, 162
LDI r12, 428
LDI r13, 152
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
