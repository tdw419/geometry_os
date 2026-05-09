; DESCRIPTION: Places a white line segment connecting (62, 46) to (21, 129).
; PLAN: r0=62(x1), r1=46(y1), r2=21(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 46
LDI r2, 21
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
