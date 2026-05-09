; DESCRIPTION: Renders a black line between points (76, 102) and (149, 178).
; PLAN: r0=76(x1), r1=102(y1), r2=149(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 102
LDI r2, 149
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
