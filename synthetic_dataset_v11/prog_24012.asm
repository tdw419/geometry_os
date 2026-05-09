; DESCRIPTION: Renders a blue line between points (0, 203) and (96, 184).
; PLAN: r0=0(x1), r1=203(y1), r2=96(x2), r3=184(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 203
LDI r2, 96
LDI r3, 184
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
