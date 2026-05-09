; DESCRIPTION: Renders a green line between points (314, 138) and (223, 47).
; PLAN: r0=314(x1), r1=138(y1), r2=223(x2), r3=47(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 138
LDI r2, 223
LDI r3, 47
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
