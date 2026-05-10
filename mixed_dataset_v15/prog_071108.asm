; DESCRIPTION: Composite: Sets a single blue pixel at (501, 160) then Draws a green line from (375, 181) to (153, 153) then Draws a cyan circle centered at (312, 97) with radius 76.
; PLAN: r0=501(x), r1=160(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=375(x1), r6=181(y1), r7=153(x2), r8=153(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=312(x), r11=97(y), r12=76(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 501
LDI r1, 160
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 181
LDI r7, 153
LDI r8, 153
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 312
LDI r11, 97
LDI r12, 76
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
