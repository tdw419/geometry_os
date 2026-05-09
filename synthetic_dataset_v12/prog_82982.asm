; DESCRIPTION: Places a purple line segment connecting (421, 165) to (344, 10).
; PLAN: r0=421(x1), r1=165(y1), r2=344(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 165
LDI r2, 344
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
