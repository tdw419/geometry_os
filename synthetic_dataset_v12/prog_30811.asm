; DESCRIPTION: Places a green line segment connecting (343, 140) to (293, 109).
; PLAN: r0=343(x1), r1=140(y1), r2=293(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 140
LDI r2, 293
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
