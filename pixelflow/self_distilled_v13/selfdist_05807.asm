; DESCRIPTION: Draws a blue line from (84, 92) to (100, 57).
; PLAN: r0=84(x1), r1=92(y1), r2=100(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 92
LDI r2, 100
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
