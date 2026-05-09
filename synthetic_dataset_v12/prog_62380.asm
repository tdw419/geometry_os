; DESCRIPTION: Places a red line segment connecting (376, 187) to (503, 72).
; PLAN: r0=376(x1), r1=187(y1), r2=503(x2), r3=72(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 187
LDI r2, 503
LDI r3, 72
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
