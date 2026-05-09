; DESCRIPTION: Places a white line segment connecting (220, 9) to (159, 227).
; PLAN: r0=220(x1), r1=9(y1), r2=159(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 9
LDI r2, 159
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
