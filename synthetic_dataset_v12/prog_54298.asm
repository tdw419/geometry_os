; DESCRIPTION: Places a magenta line segment connecting (77, 56) to (63, 67).
; PLAN: r0=77(x1), r1=56(y1), r2=63(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 56
LDI r2, 63
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
