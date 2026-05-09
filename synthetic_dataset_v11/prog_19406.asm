; DESCRIPTION: Places a red line segment connecting (135, 83) to (2, 102).
; PLAN: r0=135(x1), r1=83(y1), r2=2(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 83
LDI r2, 2
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
