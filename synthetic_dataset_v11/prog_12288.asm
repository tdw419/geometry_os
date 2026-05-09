; DESCRIPTION: Draws a magenta line from (85, 6) to (243, 100).
; PLAN: r0=85(x1), r1=6(y1), r2=243(x2), r3=100(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 6
LDI r2, 243
LDI r3, 100
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
