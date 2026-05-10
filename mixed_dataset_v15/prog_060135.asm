; DESCRIPTION: Renders a white line between points (423, 138) and (109, 158).
; PLAN: r0=423(x1), r1=138(y1), r2=109(x2), r3=158(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 138
LDI r2, 109
LDI r3, 158
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
