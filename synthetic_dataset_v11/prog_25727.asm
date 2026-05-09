; DESCRIPTION: Places a magenta line segment connecting (2, 160) to (57, 66).
; PLAN: r0=2(x1), r1=160(y1), r2=57(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 160
LDI r2, 57
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
