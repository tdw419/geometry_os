; DESCRIPTION: Places a red line segment connecting (123, 76) to (183, 66).
; PLAN: r0=123(x1), r1=76(y1), r2=183(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 76
LDI r2, 183
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
