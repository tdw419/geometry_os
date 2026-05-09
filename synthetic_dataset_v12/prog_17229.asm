; DESCRIPTION: Places a white line segment connecting (159, 216) to (459, 189).
; PLAN: r0=159(x1), r1=216(y1), r2=459(x2), r3=189(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 216
LDI r2, 459
LDI r3, 189
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
