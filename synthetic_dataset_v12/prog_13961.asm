; DESCRIPTION: Places a yellow line segment connecting (146, 35) to (344, 85).
; PLAN: r0=146(x1), r1=35(y1), r2=344(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 35
LDI r2, 344
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
