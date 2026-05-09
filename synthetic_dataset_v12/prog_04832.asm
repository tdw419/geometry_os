; DESCRIPTION: Renders a white line between points (422, 136) and (0, 211).
; PLAN: r0=422(x1), r1=136(y1), r2=0(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 136
LDI r2, 0
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
