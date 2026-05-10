; DESCRIPTION: Places a purple line segment connecting (346, 116) to (429, 77).
; PLAN: r0=346(x1), r1=116(y1), r2=429(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 116
LDI r2, 429
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
