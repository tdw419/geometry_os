; DESCRIPTION: Composite: Places a cyan line segment connecting (139, 58) to (444, 2) then Sets a single orange pixel at (414, 221).
; PLAN: r0=139(x1), r1=58(y1), r2=444(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=221(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 139
LDI r1, 58
LDI r2, 444
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 221
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
