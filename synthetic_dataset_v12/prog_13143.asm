; DESCRIPTION: Places a red line segment connecting (178, 232) to (232, 218).
; PLAN: r0=178(x1), r1=232(y1), r2=232(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 232
LDI r2, 232
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
