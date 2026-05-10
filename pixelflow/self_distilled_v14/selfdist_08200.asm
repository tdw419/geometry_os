; DESCRIPTION: Draws a magenta line from (135, 145) to (36, 184).
; PLAN: r0=135(x1), r1=145(y1), r2=36(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 145
LDI r2, 36
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
