; DESCRIPTION: Renders a blue line between points (111, 108) and (351, 142).
; PLAN: r0=111(x1), r1=108(y1), r2=351(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 108
LDI r2, 351
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
