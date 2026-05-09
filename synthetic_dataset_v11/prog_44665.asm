; DESCRIPTION: Places a cyan line segment connecting (194, 118) to (61, 130).
; PLAN: r0=194(x1), r1=118(y1), r2=61(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 118
LDI r2, 61
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
