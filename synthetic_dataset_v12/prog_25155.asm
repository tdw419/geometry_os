; DESCRIPTION: Renders a blue line between points (192, 100) and (488, 59).
; PLAN: r0=192(x1), r1=100(y1), r2=488(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 100
LDI r2, 488
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
