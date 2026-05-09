; DESCRIPTION: Renders a white line between points (448, 184) and (76, 181).
; PLAN: r0=448(x1), r1=184(y1), r2=76(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 184
LDI r2, 76
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
