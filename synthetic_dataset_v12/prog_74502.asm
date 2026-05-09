; DESCRIPTION: Places a magenta line segment connecting (112, 119) to (480, 61).
; PLAN: r0=112(x1), r1=119(y1), r2=480(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 119
LDI r2, 480
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
