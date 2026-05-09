; DESCRIPTION: Draws a magenta line from (110, 168) to (145, 153).
; PLAN: r0=110(x1), r1=168(y1), r2=145(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 168
LDI r2, 145
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
