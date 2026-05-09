; DESCRIPTION: Places a red line segment connecting (459, 40) to (268, 87).
; PLAN: r0=459(x1), r1=40(y1), r2=268(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 40
LDI r2, 268
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
