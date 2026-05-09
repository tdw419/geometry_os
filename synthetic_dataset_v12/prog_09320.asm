; DESCRIPTION: Places a red line segment connecting (86, 122) to (429, 77).
; PLAN: r0=86(x1), r1=122(y1), r2=429(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 122
LDI r2, 429
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
