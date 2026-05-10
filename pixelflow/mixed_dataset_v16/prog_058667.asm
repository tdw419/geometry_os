; DESCRIPTION: Renders a blue line between points (119, 120) and (442, 53).
; PLAN: r0=119(x1), r1=120(y1), r2=442(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 120
LDI r2, 442
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
