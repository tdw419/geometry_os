; DESCRIPTION: Renders a yellow line between points (381, 8) and (334, 102).
; PLAN: r0=381(x1), r1=8(y1), r2=334(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 8
LDI r2, 334
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
