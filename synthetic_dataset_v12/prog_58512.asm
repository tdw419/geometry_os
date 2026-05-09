; DESCRIPTION: Places a magenta line segment connecting (52, 24) to (429, 28).
; PLAN: r0=52(x1), r1=24(y1), r2=429(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 24
LDI r2, 429
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
