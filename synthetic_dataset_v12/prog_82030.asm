; DESCRIPTION: Renders a blue line between points (241, 241) and (4, 158).
; PLAN: r0=241(x1), r1=241(y1), r2=4(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 241
LDI r2, 4
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
