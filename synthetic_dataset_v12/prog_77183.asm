; DESCRIPTION: Places a red line segment connecting (267, 11) to (429, 128).
; PLAN: r0=267(x1), r1=11(y1), r2=429(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 11
LDI r2, 429
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
