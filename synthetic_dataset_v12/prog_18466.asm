; DESCRIPTION: Places a magenta line segment connecting (457, 5) to (405, 157).
; PLAN: r0=457(x1), r1=5(y1), r2=405(x2), r3=157(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 5
LDI r2, 405
LDI r3, 157
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
