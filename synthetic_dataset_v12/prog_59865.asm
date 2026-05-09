; DESCRIPTION: Renders a orange line between points (132, 108) and (494, 147).
; PLAN: r0=132(x1), r1=108(y1), r2=494(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 108
LDI r2, 494
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
