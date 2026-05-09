; DESCRIPTION: Places a orange line segment connecting (429, 247) to (111, 218).
; PLAN: r0=429(x1), r1=247(y1), r2=111(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 247
LDI r2, 111
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
