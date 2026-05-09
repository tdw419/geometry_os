; DESCRIPTION: Renders a blue line between points (134, 217) and (312, 132).
; PLAN: r0=134(x1), r1=217(y1), r2=312(x2), r3=132(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 217
LDI r2, 312
LDI r3, 132
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
