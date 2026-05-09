; DESCRIPTION: Renders a black line between points (62, 133) and (83, 162).
; PLAN: r0=62(x1), r1=133(y1), r2=83(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 133
LDI r2, 83
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
