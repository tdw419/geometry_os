; DESCRIPTION: Renders a yellow line between points (37, 10) and (93, 212).
; PLAN: r0=37(x1), r1=10(y1), r2=93(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 10
LDI r2, 93
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
