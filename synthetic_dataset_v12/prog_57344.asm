; DESCRIPTION: Places a magenta line segment connecting (396, 61) to (395, 148).
; PLAN: r0=396(x1), r1=61(y1), r2=395(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 61
LDI r2, 395
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
