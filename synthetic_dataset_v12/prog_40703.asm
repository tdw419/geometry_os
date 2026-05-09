; DESCRIPTION: Renders a blue line between points (462, 193) and (288, 151).
; PLAN: r0=462(x1), r1=193(y1), r2=288(x2), r3=151(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 193
LDI r2, 288
LDI r3, 151
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
