; DESCRIPTION: Renders a black line between points (101, 47) and (244, 88).
; PLAN: r0=101(x1), r1=47(y1), r2=244(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 47
LDI r2, 244
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
