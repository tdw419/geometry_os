; DESCRIPTION: Renders a black line between points (145, 122) and (149, 25).
; PLAN: r0=145(x1), r1=122(y1), r2=149(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 122
LDI r2, 149
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
