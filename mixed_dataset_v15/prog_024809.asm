; DESCRIPTION: Places a magenta line segment connecting (280, 212) to (454, 116).
; PLAN: r0=280(x1), r1=212(y1), r2=454(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 212
LDI r2, 454
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
