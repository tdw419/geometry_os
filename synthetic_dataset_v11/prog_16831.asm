; DESCRIPTION: Places a red line segment connecting (34, 0) to (212, 63).
; PLAN: r0=34(x1), r1=0(y1), r2=212(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 0
LDI r2, 212
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
