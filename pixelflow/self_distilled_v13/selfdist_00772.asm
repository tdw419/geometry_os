; DESCRIPTION: Renders a orange line segment connecting (322, 145) to (191, 133).
; PLAN: r0=322(x1), r1=145(y1), r2=191(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 145
LDI r2, 191
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
