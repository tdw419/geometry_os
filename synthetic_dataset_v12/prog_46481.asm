; DESCRIPTION: Renders a black line between points (14, 135) and (181, 254).
; PLAN: r0=14(x1), r1=135(y1), r2=181(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 135
LDI r2, 181
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
