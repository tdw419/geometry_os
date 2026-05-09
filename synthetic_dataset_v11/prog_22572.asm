; DESCRIPTION: Draws a blue line from (155, 56) to (222, 125).
; PLAN: r0=155(x1), r1=56(y1), r2=222(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 56
LDI r2, 222
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
