; DESCRIPTION: Places a orange line segment connecting (296, 255) to (25, 118).
; PLAN: r0=296(x1), r1=255(y1), r2=25(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 255
LDI r2, 25
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
