; DESCRIPTION: Places a magenta line segment connecting (61, 92) to (424, 69).
; PLAN: r0=61(x1), r1=92(y1), r2=424(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 92
LDI r2, 424
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
