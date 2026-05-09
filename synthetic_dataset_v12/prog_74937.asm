; DESCRIPTION: Places a white line segment connecting (205, 31) to (456, 227).
; PLAN: r0=205(x1), r1=31(y1), r2=456(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 31
LDI r2, 456
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
