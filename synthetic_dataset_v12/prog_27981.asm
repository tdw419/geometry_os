; DESCRIPTION: Places a magenta line segment connecting (388, 33) to (377, 67).
; PLAN: r0=388(x1), r1=33(y1), r2=377(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 33
LDI r2, 377
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
