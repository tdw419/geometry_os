; DESCRIPTION: Renders a yellow line between points (148, 131) and (130, 3).
; PLAN: r0=148(x1), r1=131(y1), r2=130(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 131
LDI r2, 130
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
