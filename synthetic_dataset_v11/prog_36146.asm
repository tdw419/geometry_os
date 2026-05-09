; DESCRIPTION: Places a blue line segment connecting (118, 234) to (174, 51).
; PLAN: r0=118(x1), r1=234(y1), r2=174(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 234
LDI r2, 174
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
