; DESCRIPTION: Renders a white line between points (155, 204) and (17, 133).
; PLAN: r0=155(x1), r1=204(y1), r2=17(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 204
LDI r2, 17
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
