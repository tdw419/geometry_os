; DESCRIPTION: Renders a black line between points (76, 250) and (62, 69).
; PLAN: r0=76(x1), r1=250(y1), r2=62(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 250
LDI r2, 62
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
