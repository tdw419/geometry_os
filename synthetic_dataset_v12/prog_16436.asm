; DESCRIPTION: Composite: Draws a red circle centered at (53, 129) with radius 45 then Draws a red line from (472, 201) to (208, 232) then Sets a single yellow pixel at (496, 229).
; PLAN: r0=53(x), r1=129(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x1), r6=201(y1), r7=208(x2), r8=232(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=496(x), r11=229(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 53
LDI r1, 129
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 201
LDI r7, 208
LDI r8, 232
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 496
LDI r11, 229
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
