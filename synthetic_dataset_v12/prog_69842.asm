; DESCRIPTION: Places a green line segment connecting (456, 28) to (344, 84).
; PLAN: r0=456(x1), r1=28(y1), r2=344(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 28
LDI r2, 344
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
