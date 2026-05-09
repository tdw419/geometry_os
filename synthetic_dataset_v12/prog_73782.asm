; DESCRIPTION: Renders a yellow line between points (118, 19) and (427, 19).
; PLAN: r0=118(x1), r1=19(y1), r2=427(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 19
LDI r2, 427
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
