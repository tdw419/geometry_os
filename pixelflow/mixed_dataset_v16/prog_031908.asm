; DESCRIPTION: Places a magenta line segment connecting (429, 160) to (230, 101).
; PLAN: r0=429(x1), r1=160(y1), r2=230(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 160
LDI r2, 230
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
