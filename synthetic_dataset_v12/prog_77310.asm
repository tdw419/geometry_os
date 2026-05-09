; DESCRIPTION: Renders a black line between points (170, 181) and (451, 237).
; PLAN: r0=170(x1), r1=181(y1), r2=451(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 181
LDI r2, 451
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
