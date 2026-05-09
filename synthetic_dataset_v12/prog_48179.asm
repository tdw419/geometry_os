; DESCRIPTION: Draws a magenta line from (282, 238) to (85, 106).
; PLAN: r0=282(x1), r1=238(y1), r2=85(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 238
LDI r2, 85
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
