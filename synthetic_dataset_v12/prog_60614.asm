; DESCRIPTION: Renders a white line between points (124, 227) and (49, 158).
; PLAN: r0=124(x1), r1=227(y1), r2=49(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 227
LDI r2, 49
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
