; DESCRIPTION: Places a magenta line segment connecting (83, 23) to (166, 84).
; PLAN: r0=83(x1), r1=23(y1), r2=166(x2), r3=84(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 23
LDI r2, 166
LDI r3, 84
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
