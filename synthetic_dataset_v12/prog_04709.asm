; DESCRIPTION: Places a red line segment connecting (178, 12) to (427, 23).
; PLAN: r0=178(x1), r1=12(y1), r2=427(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 12
LDI r2, 427
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
