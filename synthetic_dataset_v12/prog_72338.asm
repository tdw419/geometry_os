; DESCRIPTION: Places a white line segment connecting (244, 0) to (129, 134).
; PLAN: r0=244(x1), r1=0(y1), r2=129(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 0
LDI r2, 129
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
