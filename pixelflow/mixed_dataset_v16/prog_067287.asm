; DESCRIPTION: Places a red line segment connecting (128, 246) to (289, 79).
; PLAN: r0=128(x1), r1=246(y1), r2=289(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 246
LDI r2, 289
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
