; DESCRIPTION: Renders a blue line between points (26, 108) and (335, 11).
; PLAN: r0=26(x1), r1=108(y1), r2=335(x2), r3=11(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 108
LDI r2, 335
LDI r3, 11
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
