; DESCRIPTION: Composite: Places a cyan line segment connecting (373, 176) to (498, 197) then Sets a single yellow pixel at (366, 54).
; PLAN: r0=373(x1), r1=176(y1), r2=498(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=366(x), r6=54(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 176
LDI r2, 498
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 54
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
