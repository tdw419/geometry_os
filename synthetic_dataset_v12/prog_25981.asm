; DESCRIPTION: Renders a white line between points (484, 55) and (396, 204).
; PLAN: r0=484(x1), r1=55(y1), r2=396(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 55
LDI r2, 396
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
