; DESCRIPTION: Composite: Sets a single blue pixel at (187, 179) then Places a red line segment connecting (283, 86) to (152, 170) then Places a magenta circle of radius 15 at center (471, 208).
; PLAN: r0=187(x), r1=179(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=283(x1), r6=86(y1), r7=152(x2), r8=170(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=471(x), r11=208(y), r12=15(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 187
LDI r1, 179
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 86
LDI r7, 152
LDI r8, 170
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 471
LDI r11, 208
LDI r12, 15
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
