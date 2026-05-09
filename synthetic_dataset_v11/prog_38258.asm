; DESCRIPTION: Renders a black line between points (158, 108) and (185, 2).
; PLAN: r0=158(x1), r1=108(y1), r2=185(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 108
LDI r2, 185
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
