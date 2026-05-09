; DESCRIPTION: Renders a yellow line between points (37, 61) and (511, 211).
; PLAN: r0=37(x1), r1=61(y1), r2=511(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 61
LDI r2, 511
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
