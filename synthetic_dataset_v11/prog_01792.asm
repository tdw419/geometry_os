; DESCRIPTION: Places a magenta line segment connecting (94, 238) to (203, 79).
; PLAN: r0=94(x1), r1=238(y1), r2=203(x2), r3=79(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 238
LDI r2, 203
LDI r3, 79
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
