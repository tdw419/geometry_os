; DESCRIPTION: Places a red line segment connecting (6, 236) to (459, 70).
; PLAN: r0=6(x1), r1=236(y1), r2=459(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 236
LDI r2, 459
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
