; DESCRIPTION: Renders a black line between points (19, 217) and (149, 39).
; PLAN: r0=19(x1), r1=217(y1), r2=149(x2), r3=39(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 217
LDI r2, 149
LDI r3, 39
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
