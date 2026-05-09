; DESCRIPTION: Places a magenta line segment connecting (361, 49) to (108, 90).
; PLAN: r0=361(x1), r1=49(y1), r2=108(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 49
LDI r2, 108
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
