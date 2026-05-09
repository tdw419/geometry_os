; DESCRIPTION: Places a cyan line segment connecting (7, 66) to (194, 201).
; PLAN: r0=7(x1), r1=66(y1), r2=194(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 66
LDI r2, 194
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
