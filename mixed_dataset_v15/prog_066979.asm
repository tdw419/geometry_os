; DESCRIPTION: Composite: Places a magenta line segment connecting (61, 24) to (300, 18) then Sets a single black pixel at (49, 97).
; PLAN: r0=61(x1), r1=24(y1), r2=300(x2), r3=18(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=97(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 61
LDI r1, 24
LDI r2, 300
LDI r3, 18
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 97
LDI r7, 0x000000
PSET r5, r6, r7
HALT
