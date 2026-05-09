; DESCRIPTION: Places a white line segment connecting (227, 135) to (248, 54).
; PLAN: r0=227(x1), r1=135(y1), r2=248(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 135
LDI r2, 248
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
