; DESCRIPTION: Renders a blue line between points (308, 43) and (149, 14).
; PLAN: r0=308(x1), r1=43(y1), r2=149(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 43
LDI r2, 149
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
