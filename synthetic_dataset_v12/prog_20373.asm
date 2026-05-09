; DESCRIPTION: Renders a green line between points (34, 11) and (472, 223).
; PLAN: r0=34(x1), r1=11(y1), r2=472(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 11
LDI r2, 472
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
