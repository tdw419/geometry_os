; DESCRIPTION: Draws a magenta line from (83, 49) to (22, 122).
; PLAN: r0=83(x1), r1=49(y1), r2=22(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 49
LDI r2, 22
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
