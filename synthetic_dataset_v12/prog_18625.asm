; DESCRIPTION: Draws a blue line from (450, 56) to (312, 145).
; PLAN: r0=450(x1), r1=56(y1), r2=312(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 56
LDI r2, 312
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
