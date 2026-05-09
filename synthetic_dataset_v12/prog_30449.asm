; DESCRIPTION: Renders a purple line between points (164, 250) and (165, 227).
; PLAN: r0=164(x1), r1=250(y1), r2=165(x2), r3=227(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 250
LDI r2, 165
LDI r3, 227
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
