; DESCRIPTION: Places a red line segment connecting (318, 74) to (94, 143).
; PLAN: r0=318(x1), r1=74(y1), r2=94(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 74
LDI r2, 94
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
