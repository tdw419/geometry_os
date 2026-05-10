; DESCRIPTION: Renders a yellow line between points (341, 189) and (303, 11).
; PLAN: r0=341(x1), r1=189(y1), r2=303(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 189
LDI r2, 303
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
