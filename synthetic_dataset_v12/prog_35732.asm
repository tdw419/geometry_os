; DESCRIPTION: Places a cyan line segment connecting (476, 84) to (344, 121).
; PLAN: r0=476(x1), r1=84(y1), r2=344(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 84
LDI r2, 344
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
