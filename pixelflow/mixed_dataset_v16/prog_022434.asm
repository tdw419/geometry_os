; DESCRIPTION: Composite: Sets a single blue pixel at (283, 179) then Creates a black rectangular region at (211, 185) spanning 86 by 42 pixels then Places a yellow line segment connecting (424, 234) to (438, 216).
; PLAN: r0=283(x), r1=179(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=185(y), r7=86(width), r8=42(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=424(x1), r11=234(y1), r12=438(x2), r13=216(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 179
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 185
LDI r7, 86
LDI r8, 42
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 424
LDI r11, 234
LDI r12, 438
LDI r13, 216
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
