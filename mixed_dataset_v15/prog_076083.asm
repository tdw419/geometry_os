; DESCRIPTION: Places a red line segment connecting (134, 245) to (115, 56).
; PLAN: r0=134(x1), r1=245(y1), r2=115(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 245
LDI r2, 115
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
