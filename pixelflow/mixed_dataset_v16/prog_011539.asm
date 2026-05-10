; DESCRIPTION: Places a red line segment connecting (459, 181) to (296, 23).
; PLAN: r0=459(x1), r1=181(y1), r2=296(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 181
LDI r2, 296
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
