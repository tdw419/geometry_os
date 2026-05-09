; DESCRIPTION: Places a magenta line segment connecting (2, 217) to (234, 64).
; PLAN: r0=2(x1), r1=217(y1), r2=234(x2), r3=64(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 217
LDI r2, 234
LDI r3, 64
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
