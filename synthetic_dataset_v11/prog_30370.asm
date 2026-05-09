; DESCRIPTION: Draws a magenta line from (247, 85) to (43, 35).
; PLAN: r0=247(x1), r1=85(y1), r2=43(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 85
LDI r2, 43
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
