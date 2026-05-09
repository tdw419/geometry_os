; DESCRIPTION: Renders a white line between points (113, 158) and (312, 62).
; PLAN: r0=113(x1), r1=158(y1), r2=312(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 158
LDI r2, 312
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
