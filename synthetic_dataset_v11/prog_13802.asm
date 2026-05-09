; DESCRIPTION: Places a white line segment connecting (191, 54) to (34, 176).
; PLAN: r0=191(x1), r1=54(y1), r2=34(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 54
LDI r2, 34
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
