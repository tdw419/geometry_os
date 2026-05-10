; DESCRIPTION: Places a white line segment connecting (415, 192) to (134, 129).
; PLAN: r0=415(x1), r1=192(y1), r2=134(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 192
LDI r2, 134
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
