; DESCRIPTION: Places a red line segment connecting (18, 83) to (203, 124).
; PLAN: r0=18(x1), r1=83(y1), r2=203(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 83
LDI r2, 203
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
