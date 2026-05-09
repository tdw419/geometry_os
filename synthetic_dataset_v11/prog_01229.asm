; DESCRIPTION: Renders a blue line between points (44, 181) and (166, 122).
; PLAN: r0=44(x1), r1=181(y1), r2=166(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 181
LDI r2, 166
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
