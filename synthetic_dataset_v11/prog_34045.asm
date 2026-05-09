; DESCRIPTION: Places a magenta line segment connecting (103, 247) to (23, 97).
; PLAN: r0=103(x1), r1=247(y1), r2=23(x2), r3=97(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 247
LDI r2, 23
LDI r3, 97
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
