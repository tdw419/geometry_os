; DESCRIPTION: Draws a blue line from (169, 43) to (3, 61).
; PLAN: r0=169(x1), r1=43(y1), r2=3(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 43
LDI r2, 3
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
