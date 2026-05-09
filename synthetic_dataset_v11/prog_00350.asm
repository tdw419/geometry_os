; DESCRIPTION: Places a blue line segment connecting (51, 58) to (140, 72).
; PLAN: r0=51(x1), r1=58(y1), r2=140(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 58
LDI r2, 140
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
