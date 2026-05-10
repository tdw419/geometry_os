; DESCRIPTION: Renders a blue line between points (142, 133) and (442, 83).
; PLAN: r0=142(x1), r1=133(y1), r2=442(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 133
LDI r2, 442
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
