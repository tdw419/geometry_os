; DESCRIPTION: Places a magenta line segment connecting (413, 78) to (116, 80).
; PLAN: r0=413(x1), r1=78(y1), r2=116(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 78
LDI r2, 116
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
