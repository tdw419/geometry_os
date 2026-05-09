; DESCRIPTION: Renders a black line between points (34, 49) and (132, 214).
; PLAN: r0=34(x1), r1=49(y1), r2=132(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 49
LDI r2, 132
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
