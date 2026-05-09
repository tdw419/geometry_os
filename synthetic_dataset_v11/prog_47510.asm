; DESCRIPTION: Draws a blue line from (145, 33) to (10, 61).
; PLAN: r0=145(x1), r1=33(y1), r2=10(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 33
LDI r2, 10
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
