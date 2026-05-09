; DESCRIPTION: Places a white line segment connecting (200, 196) to (192, 76).
; PLAN: r0=200(x1), r1=196(y1), r2=192(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 196
LDI r2, 192
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
