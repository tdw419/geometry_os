; DESCRIPTION: Draws a blue line from (145, 217) to (107, 7).
; PLAN: r0=145(x1), r1=217(y1), r2=107(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 217
LDI r2, 107
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
