; DESCRIPTION: Places a magenta line segment connecting (2, 2) to (113, 67).
; PLAN: r0=2(x1), r1=2(y1), r2=113(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 2
LDI r2, 113
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
