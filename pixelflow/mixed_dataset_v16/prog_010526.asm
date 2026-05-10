; DESCRIPTION: Places a red line segment connecting (373, 119) to (430, 198).
; PLAN: r0=373(x1), r1=119(y1), r2=430(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 119
LDI r2, 430
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
