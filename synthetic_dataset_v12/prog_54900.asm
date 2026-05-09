; DESCRIPTION: Renders a white line between points (231, 100) and (355, 129).
; PLAN: r0=231(x1), r1=100(y1), r2=355(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 100
LDI r2, 355
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
