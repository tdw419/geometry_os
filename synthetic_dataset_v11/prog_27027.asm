; DESCRIPTION: Draws a magenta line from (0, 155) to (4, 76).
; PLAN: r0=0(x1), r1=155(y1), r2=4(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 155
LDI r2, 4
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
