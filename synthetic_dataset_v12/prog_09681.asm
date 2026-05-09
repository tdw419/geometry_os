; DESCRIPTION: Draws a blue line from (312, 138) to (138, 145).
; PLAN: r0=312(x1), r1=138(y1), r2=138(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 138
LDI r2, 138
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
