; DESCRIPTION: Places a magenta line segment connecting (337, 83) to (45, 145).
; PLAN: r0=337(x1), r1=83(y1), r2=45(x2), r3=145(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 83
LDI r2, 45
LDI r3, 145
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
