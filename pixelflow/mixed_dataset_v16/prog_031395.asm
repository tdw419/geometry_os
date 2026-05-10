; DESCRIPTION: Renders a blue line between points (204, 132) and (444, 39).
; PLAN: r0=204(x1), r1=132(y1), r2=444(x2), r3=39(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 132
LDI r2, 444
LDI r3, 39
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
