; DESCRIPTION: Draws a blue line from (100, 92) to (43, 44).
; PLAN: r0=100(x1), r1=92(y1), r2=43(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 92
LDI r2, 43
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
