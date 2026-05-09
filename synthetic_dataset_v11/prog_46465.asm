; DESCRIPTION: Renders a blue line between points (88, 26) and (153, 153).
; PLAN: r0=88(x1), r1=26(y1), r2=153(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 26
LDI r2, 153
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
