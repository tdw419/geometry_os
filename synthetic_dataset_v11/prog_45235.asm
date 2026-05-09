; DESCRIPTION: Places a white line segment connecting (195, 4) to (155, 52).
; PLAN: r0=195(x1), r1=4(y1), r2=155(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 4
LDI r2, 155
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
