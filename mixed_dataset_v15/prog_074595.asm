; DESCRIPTION: Places a magenta line segment connecting (396, 119) to (175, 47).
; PLAN: r0=396(x1), r1=119(y1), r2=175(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 119
LDI r2, 175
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
