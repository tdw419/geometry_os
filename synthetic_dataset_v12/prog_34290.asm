; DESCRIPTION: Places a red line segment connecting (259, 228) to (251, 56).
; PLAN: r0=259(x1), r1=228(y1), r2=251(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 228
LDI r2, 251
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
