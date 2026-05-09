; DESCRIPTION: Renders a green line between points (77, 189) and (423, 58).
; PLAN: r0=77(x1), r1=189(y1), r2=423(x2), r3=58(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 189
LDI r2, 423
LDI r3, 58
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
