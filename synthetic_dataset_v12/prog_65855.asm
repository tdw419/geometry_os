; DESCRIPTION: Places a magenta line segment connecting (222, 123) to (326, 29).
; PLAN: r0=222(x1), r1=123(y1), r2=326(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 123
LDI r2, 326
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
