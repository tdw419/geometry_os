; DESCRIPTION: Places a red line segment connecting (116, 39) to (10, 87).
; PLAN: r0=116(x1), r1=39(y1), r2=10(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 39
LDI r2, 10
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
