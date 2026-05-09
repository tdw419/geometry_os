; DESCRIPTION: Draws a blue line from (45, 100) to (63, 205).
; PLAN: r0=45(x1), r1=100(y1), r2=63(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 100
LDI r2, 63
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
