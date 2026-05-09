; DESCRIPTION: Renders a yellow line between points (475, 155) and (47, 84).
; PLAN: r0=475(x1), r1=155(y1), r2=47(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 155
LDI r2, 47
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
