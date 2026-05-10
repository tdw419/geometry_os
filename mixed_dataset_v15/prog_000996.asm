; DESCRIPTION: Composite: Places a cyan line segment connecting (130, 183) to (419, 12) then Places a orange dot at position (34, 153) then Creates a red circular shape at (248, 197) with radius 58.
; PLAN: r0=130(x1), r1=183(y1), r2=419(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=34(x), r6=153(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=248(x), r11=197(y), r12=58(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 130
LDI r1, 183
LDI r2, 419
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 153
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 248
LDI r11, 197
LDI r12, 58
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
