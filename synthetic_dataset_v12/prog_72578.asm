; DESCRIPTION: Places a white line segment connecting (429, 118) to (322, 3).
; PLAN: r0=429(x1), r1=118(y1), r2=322(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 118
LDI r2, 322
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
