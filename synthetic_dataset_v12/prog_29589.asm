; DESCRIPTION: Places a white line segment connecting (44, 121) to (96, 110).
; PLAN: r0=44(x1), r1=121(y1), r2=96(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 121
LDI r2, 96
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
