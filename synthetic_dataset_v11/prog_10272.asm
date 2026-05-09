; DESCRIPTION: Places a red line segment connecting (153, 90) to (90, 76).
; PLAN: r0=153(x1), r1=90(y1), r2=90(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 90
LDI r2, 90
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
