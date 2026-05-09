; DESCRIPTION: Renders a black line between points (192, 88) and (105, 19).
; PLAN: r0=192(x1), r1=88(y1), r2=105(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 88
LDI r2, 105
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
