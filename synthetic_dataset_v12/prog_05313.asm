; DESCRIPTION: Places a white line segment connecting (324, 113) to (478, 211).
; PLAN: r0=324(x1), r1=113(y1), r2=478(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 113
LDI r2, 478
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
