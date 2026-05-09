; DESCRIPTION: Renders a blue line between points (7, 250) and (47, 63).
; PLAN: r0=7(x1), r1=250(y1), r2=47(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 250
LDI r2, 47
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
