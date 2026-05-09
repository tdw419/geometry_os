; DESCRIPTION: Renders a white line between points (158, 198) and (94, 89).
; PLAN: r0=158(x1), r1=198(y1), r2=94(x2), r3=89(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 198
LDI r2, 94
LDI r3, 89
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
