; DESCRIPTION: Places a red line segment connecting (184, 62) to (232, 40).
; PLAN: r0=184(x1), r1=62(y1), r2=232(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 62
LDI r2, 232
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
