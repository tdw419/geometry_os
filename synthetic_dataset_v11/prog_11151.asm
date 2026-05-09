; DESCRIPTION: Places a red line segment connecting (60, 66) to (56, 33).
; PLAN: r0=60(x1), r1=66(y1), r2=56(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 66
LDI r2, 56
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
