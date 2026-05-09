; DESCRIPTION: Places a magenta line segment connecting (193, 181) to (64, 62).
; PLAN: r0=193(x1), r1=181(y1), r2=64(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 181
LDI r2, 64
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
