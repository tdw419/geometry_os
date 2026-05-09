; DESCRIPTION: Places a white line segment connecting (13, 29) to (344, 75).
; PLAN: r0=13(x1), r1=29(y1), r2=344(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 29
LDI r2, 344
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
