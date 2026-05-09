; DESCRIPTION: Renders a yellow line between points (53, 137) and (102, 140).
; PLAN: r0=53(x1), r1=137(y1), r2=102(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 137
LDI r2, 102
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
