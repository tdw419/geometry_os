; DESCRIPTION: Places a magenta line segment connecting (337, 33) to (89, 244).
; PLAN: r0=337(x1), r1=33(y1), r2=89(x2), r3=244(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 33
LDI r2, 89
LDI r3, 244
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
