; DESCRIPTION: Renders a black line between points (132, 244) and (451, 102).
; PLAN: r0=132(x1), r1=244(y1), r2=451(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 244
LDI r2, 451
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
