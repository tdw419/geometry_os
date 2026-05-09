; DESCRIPTION: Places a white line segment connecting (57, 31) to (2, 203).
; PLAN: r0=57(x1), r1=31(y1), r2=2(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 31
LDI r2, 2
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
