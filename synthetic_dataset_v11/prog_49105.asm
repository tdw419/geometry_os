; DESCRIPTION: Draws a blue line from (250, 172) to (47, 112).
; PLAN: r0=250(x1), r1=172(y1), r2=47(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 172
LDI r2, 47
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
