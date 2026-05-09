; DESCRIPTION: Renders a blue line between points (138, 167) and (194, 14).
; PLAN: r0=138(x1), r1=167(y1), r2=194(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 167
LDI r2, 194
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
