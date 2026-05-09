; DESCRIPTION: Draws a magenta line from (396, 56) to (200, 69).
; PLAN: r0=396(x1), r1=56(y1), r2=200(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 56
LDI r2, 200
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
