; DESCRIPTION: Places a red line segment connecting (323, 93) to (354, 85).
; PLAN: r0=323(x1), r1=93(y1), r2=354(x2), r3=85(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 93
LDI r2, 354
LDI r3, 85
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
