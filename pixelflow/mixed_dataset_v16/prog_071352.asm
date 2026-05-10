; DESCRIPTION: Draws a blue line from (181, 216) to (99, 57).
; PLAN: r0=181(x1), r1=216(y1), r2=99(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 216
LDI r2, 99
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
