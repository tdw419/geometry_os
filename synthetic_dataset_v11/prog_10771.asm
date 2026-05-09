; DESCRIPTION: Renders a yellow line between points (83, 0) and (11, 102).
; PLAN: r0=83(x1), r1=0(y1), r2=11(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 0
LDI r2, 11
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
