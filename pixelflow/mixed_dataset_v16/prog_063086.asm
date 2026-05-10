; DESCRIPTION: Composite: Renders a orange line between points (398, 67) and (177, 167) then Sets a single yellow pixel at (510, 105).
; PLAN: r0=398(x1), r1=67(y1), r2=177(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=510(x), r6=105(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 398
LDI r1, 67
LDI r2, 177
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 105
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
