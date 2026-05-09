; DESCRIPTION: Places a red line segment connecting (489, 195) to (414, 115).
; PLAN: r0=489(x1), r1=195(y1), r2=414(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 195
LDI r2, 414
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
