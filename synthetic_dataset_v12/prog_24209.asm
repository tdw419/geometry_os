; DESCRIPTION: Renders a purple line between points (166, 153) and (93, 12).
; PLAN: r0=166(x1), r1=153(y1), r2=93(x2), r3=12(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 153
LDI r2, 93
LDI r3, 12
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
