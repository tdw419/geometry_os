; DESCRIPTION: Places a black line segment connecting (212, 230) to (344, 84).
; PLAN: r0=212(x1), r1=230(y1), r2=344(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 230
LDI r2, 344
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
