; DESCRIPTION: Renders a yellow line between points (361, 211) and (322, 245).
; PLAN: r0=361(x1), r1=211(y1), r2=322(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 211
LDI r2, 322
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
