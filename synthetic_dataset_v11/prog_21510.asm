; DESCRIPTION: Places a white line segment connecting (119, 159) to (3, 11).
; PLAN: r0=119(x1), r1=159(y1), r2=3(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 159
LDI r2, 3
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
