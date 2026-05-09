; DESCRIPTION: Places a red line segment connecting (14, 159) to (69, 90).
; PLAN: r0=14(x1), r1=159(y1), r2=69(x2), r3=90(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 159
LDI r2, 69
LDI r3, 90
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
