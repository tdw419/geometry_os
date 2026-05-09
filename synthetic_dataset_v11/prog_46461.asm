; DESCRIPTION: Places a red line segment connecting (6, 12) to (99, 68).
; PLAN: r0=6(x1), r1=12(y1), r2=99(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 12
LDI r2, 99
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
