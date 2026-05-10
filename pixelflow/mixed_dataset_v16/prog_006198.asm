; DESCRIPTION: Composite: Places a magenta line segment connecting (83, 66) to (109, 45) then Sets a single red pixel at (437, 43).
; PLAN: r0=83(x1), r1=66(y1), r2=109(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=437(x), r6=43(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 83
LDI r1, 66
LDI r2, 109
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 437
LDI r6, 43
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
