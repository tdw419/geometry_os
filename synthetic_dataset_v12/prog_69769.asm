; DESCRIPTION: Renders a green line between points (174, 11) and (314, 211).
; PLAN: r0=174(x1), r1=11(y1), r2=314(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 11
LDI r2, 314
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
