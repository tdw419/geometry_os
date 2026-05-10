; DESCRIPTION: Places a black line segment connecting (195, 182) to (37, 44).
; PLAN: r0=195(x1), r1=182(y1), r2=37(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 182
LDI r2, 37
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
