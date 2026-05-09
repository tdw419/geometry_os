; DESCRIPTION: Draws a purple line from (148, 145) to (234, 45).
; PLAN: r0=148(x1), r1=145(y1), r2=234(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 145
LDI r2, 234
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
