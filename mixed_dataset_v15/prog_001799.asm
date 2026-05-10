; DESCRIPTION: Renders a blue line between points (454, 255) and (159, 232).
; PLAN: r0=454(x1), r1=255(y1), r2=159(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 255
LDI r2, 159
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
