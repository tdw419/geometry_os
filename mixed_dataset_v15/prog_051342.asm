; DESCRIPTION: Renders a blue line between points (444, 95) and (451, 44).
; PLAN: r0=444(x1), r1=95(y1), r2=451(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 95
LDI r2, 451
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
