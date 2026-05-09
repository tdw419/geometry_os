; DESCRIPTION: Renders a black line between points (22, 185) and (76, 20).
; PLAN: r0=22(x1), r1=185(y1), r2=76(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 185
LDI r2, 76
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
