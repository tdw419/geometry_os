; DESCRIPTION: Composite: Places a green dot at position (229, 246) then Places a magenta line segment connecting (2, 192) to (423, 207) then Creates a blue circular shape at (172, 91) with radius 13.
; PLAN: r0=229(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=2(x1), r6=192(y1), r7=423(x2), r8=207(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=172(x), r11=91(y), r12=13(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 2
LDI r6, 192
LDI r7, 423
LDI r8, 207
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 91
LDI r12, 13
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
