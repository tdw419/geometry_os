; DESCRIPTION: Composite: Places a white line segment connecting (268, 188) to (431, 67) then Sets a single yellow pixel at (66, 80).
; PLAN: r0=268(x1), r1=188(y1), r2=431(x2), r3=67(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=66(x), r6=80(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 268
LDI r1, 188
LDI r2, 431
LDI r3, 67
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 80
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
