; DESCRIPTION: Renders a yellow line between points (148, 15) and (432, 153).
; PLAN: r0=148(x1), r1=15(y1), r2=432(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 15
LDI r2, 432
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
