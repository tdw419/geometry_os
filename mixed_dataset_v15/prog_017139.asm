; DESCRIPTION: Places a black line segment connecting (109, 159) to (204, 141).
; PLAN: r0=109(x1), r1=159(y1), r2=204(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 159
LDI r2, 204
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
