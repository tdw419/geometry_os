; DESCRIPTION: Places a orange line segment connecting (59, 7) to (344, 230).
; PLAN: r0=59(x1), r1=7(y1), r2=344(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 7
LDI r2, 344
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
