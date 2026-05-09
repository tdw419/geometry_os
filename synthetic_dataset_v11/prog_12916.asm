; DESCRIPTION: Renders a white line between points (204, 20) and (118, 70).
; PLAN: r0=204(x1), r1=20(y1), r2=118(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 20
LDI r2, 118
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
