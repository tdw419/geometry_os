; DESCRIPTION: Renders a black line between points (132, 95) and (76, 45).
; PLAN: r0=132(x1), r1=95(y1), r2=76(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 95
LDI r2, 76
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
