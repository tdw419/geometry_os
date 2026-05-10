; DESCRIPTION: Places a magenta line segment connecting (374, 156) to (395, 89).
; PLAN: r0=374(x1), r1=156(y1), r2=395(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 156
LDI r2, 395
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
