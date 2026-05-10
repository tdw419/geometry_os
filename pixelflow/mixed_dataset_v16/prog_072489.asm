; DESCRIPTION: Places a green line segment connecting (151, 156) to (14, 89).
; PLAN: r0=151(x1), r1=156(y1), r2=14(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 156
LDI r2, 14
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
