; DESCRIPTION: Places a magenta line segment connecting (212, 19) to (181, 2).
; PLAN: r0=212(x1), r1=19(y1), r2=181(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 19
LDI r2, 181
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
