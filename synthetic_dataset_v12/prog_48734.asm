; DESCRIPTION: Draws a blue line from (315, 217) to (461, 112).
; PLAN: r0=315(x1), r1=217(y1), r2=461(x2), r3=112(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 217
LDI r2, 461
LDI r3, 112
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
