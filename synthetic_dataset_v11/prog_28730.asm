; DESCRIPTION: Places a red line segment connecting (246, 246) to (11, 150).
; PLAN: r0=246(x1), r1=246(y1), r2=11(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 246
LDI r2, 11
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
