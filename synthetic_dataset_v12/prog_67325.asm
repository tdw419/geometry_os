; DESCRIPTION: Renders a blue line between points (477, 108) and (144, 122).
; PLAN: r0=477(x1), r1=108(y1), r2=144(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 108
LDI r2, 144
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
