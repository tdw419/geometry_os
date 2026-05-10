; DESCRIPTION: Draws a magenta line from (13, 140) to (55, 218).
; PLAN: r0=13(x1), r1=140(y1), r2=55(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 140
LDI r2, 55
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
