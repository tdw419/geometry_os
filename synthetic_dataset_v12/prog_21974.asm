; DESCRIPTION: Places a magenta line segment connecting (10, 56) to (426, 208).
; PLAN: r0=10(x1), r1=56(y1), r2=426(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 56
LDI r2, 426
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
