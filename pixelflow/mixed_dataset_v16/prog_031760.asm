; DESCRIPTION: Places a purple line segment connecting (343, 195) to (115, 200).
; PLAN: r0=343(x1), r1=195(y1), r2=115(x2), r3=200(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 195
LDI r2, 115
LDI r3, 200
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
