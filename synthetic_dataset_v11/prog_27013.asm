; DESCRIPTION: Draws a blue line from (75, 216) to (212, 116).
; PLAN: r0=75(x1), r1=216(y1), r2=212(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 216
LDI r2, 212
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
