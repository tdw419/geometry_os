; DESCRIPTION: Places a red line segment connecting (124, 14) to (178, 245).
; PLAN: r0=124(x1), r1=14(y1), r2=178(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 14
LDI r2, 178
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
