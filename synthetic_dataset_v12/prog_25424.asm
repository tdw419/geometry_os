; DESCRIPTION: Composite: Renders a magenta box of size 31x27 starting at (106, 147) then Draws a red line from (141, 185) to (323, 6) then Creates a yellow circular shape at (395, 201) with radius 22.
; PLAN: r0=106(x), r1=147(y), r2=31(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x1), r6=185(y1), r7=323(x2), r8=6(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=201(y), r12=22(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 106
LDI r1, 147
LDI r2, 31
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 185
LDI r7, 323
LDI r8, 6
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 201
LDI r12, 22
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
