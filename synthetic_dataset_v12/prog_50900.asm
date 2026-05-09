; DESCRIPTION: Places a black line segment connecting (204, 125) to (341, 61).
; PLAN: r0=204(x1), r1=125(y1), r2=341(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 125
LDI r2, 341
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
