; DESCRIPTION: Places a red line segment connecting (167, 113) to (324, 35).
; PLAN: r0=167(x1), r1=113(y1), r2=324(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 113
LDI r2, 324
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
