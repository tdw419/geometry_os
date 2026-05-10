; DESCRIPTION: Places a red line segment connecting (323, 156) to (82, 246).
; PLAN: r0=323(x1), r1=156(y1), r2=82(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 156
LDI r2, 82
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
