; DESCRIPTION: Renders a blue line between points (76, 43) and (244, 142).
; PLAN: r0=76(x1), r1=43(y1), r2=244(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 43
LDI r2, 244
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
