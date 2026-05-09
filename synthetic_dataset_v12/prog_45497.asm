; DESCRIPTION: Renders a blue line between points (441, 234) and (278, 163).
; PLAN: r0=441(x1), r1=234(y1), r2=278(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 234
LDI r2, 278
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
