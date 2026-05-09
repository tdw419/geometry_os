; DESCRIPTION: Places a magenta line segment connecting (388, 143) to (300, 89).
; PLAN: r0=388(x1), r1=143(y1), r2=300(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 143
LDI r2, 300
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
