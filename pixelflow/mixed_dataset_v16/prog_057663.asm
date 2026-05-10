; DESCRIPTION: Composite: Places a orange dot at position (342, 33) then Draws a purple line from (193, 183) to (322, 23) then Draws a yellow circle centered at (395, 179) with radius 62.
; PLAN: r0=342(x), r1=33(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=193(x1), r6=183(y1), r7=322(x2), r8=23(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=179(y), r12=62(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 342
LDI r1, 33
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 193
LDI r6, 183
LDI r7, 322
LDI r8, 23
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 179
LDI r12, 62
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
