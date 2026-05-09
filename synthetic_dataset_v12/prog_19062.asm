; DESCRIPTION: Places a blue line segment connecting (51, 163) to (241, 105).
; PLAN: r0=51(x1), r1=163(y1), r2=241(x2), r3=105(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 163
LDI r2, 241
LDI r3, 105
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
