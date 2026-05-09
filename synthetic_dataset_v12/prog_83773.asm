; DESCRIPTION: Renders a yellow line between points (129, 26) and (19, 36).
; PLAN: r0=129(x1), r1=26(y1), r2=19(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 26
LDI r2, 19
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
