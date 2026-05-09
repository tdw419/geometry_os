; DESCRIPTION: Renders a blue line between points (227, 120) and (462, 137).
; PLAN: r0=227(x1), r1=120(y1), r2=462(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 120
LDI r2, 462
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
