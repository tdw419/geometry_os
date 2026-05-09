; DESCRIPTION: Places a magenta line segment connecting (281, 92) to (280, 78).
; PLAN: r0=281(x1), r1=92(y1), r2=280(x2), r3=78(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 92
LDI r2, 280
LDI r3, 78
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
