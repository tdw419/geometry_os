; DESCRIPTION: Places a magenta line segment connecting (74, 52) to (429, 90).
; PLAN: r0=74(x1), r1=52(y1), r2=429(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 52
LDI r2, 429
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
