; DESCRIPTION: Places a red line segment connecting (12, 194) to (454, 20).
; PLAN: r0=12(x1), r1=194(y1), r2=454(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 194
LDI r2, 454
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
