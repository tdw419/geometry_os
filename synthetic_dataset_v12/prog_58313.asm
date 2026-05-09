; DESCRIPTION: Places a magenta line segment connecting (75, 52) to (341, 157).
; PLAN: r0=75(x1), r1=52(y1), r2=341(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 52
LDI r2, 341
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
