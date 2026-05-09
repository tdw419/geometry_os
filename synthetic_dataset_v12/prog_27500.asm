; DESCRIPTION: Places a red line segment connecting (194, 91) to (36, 87).
; PLAN: r0=194(x1), r1=91(y1), r2=36(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 91
LDI r2, 36
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
