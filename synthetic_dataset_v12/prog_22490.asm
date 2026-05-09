; DESCRIPTION: Renders a white line between points (422, 75) and (258, 85).
; PLAN: r0=422(x1), r1=75(y1), r2=258(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 75
LDI r2, 258
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
