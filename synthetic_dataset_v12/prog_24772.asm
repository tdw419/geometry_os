; DESCRIPTION: Places a red line segment connecting (68, 12) to (35, 232).
; PLAN: r0=68(x1), r1=12(y1), r2=35(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 12
LDI r2, 35
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
