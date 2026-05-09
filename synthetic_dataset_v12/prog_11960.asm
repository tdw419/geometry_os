; DESCRIPTION: Places a white line segment connecting (441, 22) to (159, 109).
; PLAN: r0=441(x1), r1=22(y1), r2=159(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 22
LDI r2, 159
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
