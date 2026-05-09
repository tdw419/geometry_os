; DESCRIPTION: Places a purple line segment connecting (344, 35) to (333, 39).
; PLAN: r0=344(x1), r1=35(y1), r2=333(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 35
LDI r2, 333
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
