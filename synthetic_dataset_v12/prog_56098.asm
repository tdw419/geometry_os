; DESCRIPTION: Renders a blue line between points (297, 88) and (265, 11).
; PLAN: r0=297(x1), r1=88(y1), r2=265(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 88
LDI r2, 265
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
