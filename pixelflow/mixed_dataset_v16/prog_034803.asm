; DESCRIPTION: Places a magenta line segment connecting (6, 123) to (234, 34).
; PLAN: r0=6(x1), r1=123(y1), r2=234(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 123
LDI r2, 234
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
