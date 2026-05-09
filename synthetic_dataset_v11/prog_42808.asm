; DESCRIPTION: Draws a blue line from (132, 169) to (125, 203).
; PLAN: r0=132(x1), r1=169(y1), r2=125(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 169
LDI r2, 125
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
