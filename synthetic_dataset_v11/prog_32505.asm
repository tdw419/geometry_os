; DESCRIPTION: Renders a blue line between points (47, 102) and (80, 183).
; PLAN: r0=47(x1), r1=102(y1), r2=80(x2), r3=183(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 102
LDI r2, 80
LDI r3, 183
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
