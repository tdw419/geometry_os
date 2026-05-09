; DESCRIPTION: Places a white line segment connecting (406, 39) to (334, 149).
; PLAN: r0=406(x1), r1=39(y1), r2=334(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 39
LDI r2, 334
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
