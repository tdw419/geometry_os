; DESCRIPTION: Places a red line segment connecting (184, 52) to (28, 251).
; PLAN: r0=184(x1), r1=52(y1), r2=28(x2), r3=251(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 52
LDI r2, 28
LDI r3, 251
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
