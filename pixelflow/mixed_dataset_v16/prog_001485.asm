; DESCRIPTION: Places a red line segment connecting (157, 113) to (2, 97).
; PLAN: r0=157(x1), r1=113(y1), r2=2(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 113
LDI r2, 2
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
