; DESCRIPTION: Places a red line segment connecting (429, 188) to (324, 2).
; PLAN: r0=429(x1), r1=188(y1), r2=324(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 188
LDI r2, 324
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
