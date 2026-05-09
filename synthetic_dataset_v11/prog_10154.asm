; DESCRIPTION: Places a red line segment connecting (31, 84) to (175, 39).
; PLAN: r0=31(x1), r1=84(y1), r2=175(x2), r3=39(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 84
LDI r2, 175
LDI r3, 39
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
