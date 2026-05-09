; DESCRIPTION: Composite: Renders a green disk with center (156, 191) and radius 63 then Places a green line segment connecting (388, 179) to (7, 232) then Sets a single black pixel at (162, 236).
; PLAN: r0=156(x), r1=191(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x1), r6=179(y1), r7=7(x2), r8=232(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=162(x), r11=236(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 191
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 179
LDI r7, 7
LDI r8, 232
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 236
LDI r12, 0x000000
PSET r10, r11, r12
HALT
