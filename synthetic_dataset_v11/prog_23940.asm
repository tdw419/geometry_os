; DESCRIPTION: Draws a magenta line from (38, 145) to (30, 217).
; PLAN: r0=38(x1), r1=145(y1), r2=30(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 145
LDI r2, 30
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
