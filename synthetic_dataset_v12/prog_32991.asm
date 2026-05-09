; DESCRIPTION: Places a red line segment connecting (454, 113) to (25, 123).
; PLAN: r0=454(x1), r1=113(y1), r2=25(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 113
LDI r2, 25
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
