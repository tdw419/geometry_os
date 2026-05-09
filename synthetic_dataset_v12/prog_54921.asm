; DESCRIPTION: Places a magenta line segment connecting (263, 156) to (391, 84).
; PLAN: r0=263(x1), r1=156(y1), r2=391(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 156
LDI r2, 391
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
