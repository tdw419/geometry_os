; DESCRIPTION: Places a magenta line segment connecting (5, 190) to (12, 254).
; PLAN: r0=5(x1), r1=190(y1), r2=12(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 190
LDI r2, 12
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
