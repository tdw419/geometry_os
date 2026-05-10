; DESCRIPTION: Renders a blue line between points (143, 198) and (125, 79).
; PLAN: r0=143(x1), r1=198(y1), r2=125(x2), r3=79(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 198
LDI r2, 125
LDI r3, 79
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
