; DESCRIPTION: Renders a red line between points (139, 132) and (56, 148).
; PLAN: r0=139(x1), r1=132(y1), r2=56(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 132
LDI r2, 56
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
