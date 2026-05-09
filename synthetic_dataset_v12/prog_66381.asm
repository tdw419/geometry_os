; DESCRIPTION: Places a red line segment connecting (207, 203) to (77, 18).
; PLAN: r0=207(x1), r1=203(y1), r2=77(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 203
LDI r2, 77
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
