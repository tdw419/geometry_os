; DESCRIPTION: Places a magenta line segment connecting (203, 92) to (337, 135).
; PLAN: r0=203(x1), r1=92(y1), r2=337(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 92
LDI r2, 337
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
