; DESCRIPTION: Places a blue line segment connecting (344, 65) to (445, 49).
; PLAN: r0=344(x1), r1=65(y1), r2=445(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 65
LDI r2, 445
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
