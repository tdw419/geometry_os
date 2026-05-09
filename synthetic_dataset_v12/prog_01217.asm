; DESCRIPTION: Renders a blue line between points (119, 100) and (460, 35).
; PLAN: r0=119(x1), r1=100(y1), r2=460(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 100
LDI r2, 460
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
