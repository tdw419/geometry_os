; DESCRIPTION: Draws a blue line from (463, 84) to (247, 216).
; PLAN: r0=463(x1), r1=84(y1), r2=247(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 84
LDI r2, 247
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
