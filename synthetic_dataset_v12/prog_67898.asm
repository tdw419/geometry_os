; DESCRIPTION: Renders a white line between points (21, 158) and (273, 121).
; PLAN: r0=21(x1), r1=158(y1), r2=273(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 158
LDI r2, 273
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
