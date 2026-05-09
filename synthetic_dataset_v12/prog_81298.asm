; DESCRIPTION: Composite: Places a magenta dot at position (398, 141) then Draws a red line from (414, 227) to (314, 32) then Creates a yellow circular shape at (139, 120) with radius 11.
; PLAN: r0=398(x), r1=141(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=414(x1), r6=227(y1), r7=314(x2), r8=32(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=139(x), r11=120(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 398
LDI r1, 141
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 414
LDI r6, 227
LDI r7, 314
LDI r8, 32
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 139
LDI r11, 120
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
