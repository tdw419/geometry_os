; DESCRIPTION: Places a white line segment connecting (34, 255) to (173, 49).
; PLAN: r0=34(x1), r1=255(y1), r2=173(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 255
LDI r2, 173
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
