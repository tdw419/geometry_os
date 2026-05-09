; DESCRIPTION: Draws a magenta line from (53, 184) to (84, 118).
; PLAN: r0=53(x1), r1=184(y1), r2=84(x2), r3=118(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 184
LDI r2, 84
LDI r3, 118
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
