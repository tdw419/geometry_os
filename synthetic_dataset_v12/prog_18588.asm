; DESCRIPTION: Places a magenta line segment connecting (84, 75) to (273, 190).
; PLAN: r0=84(x1), r1=75(y1), r2=273(x2), r3=190(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 75
LDI r2, 273
LDI r3, 190
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
