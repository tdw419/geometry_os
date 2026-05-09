; DESCRIPTION: Places a white line segment connecting (153, 244) to (77, 101).
; PLAN: r0=153(x1), r1=244(y1), r2=77(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 244
LDI r2, 77
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
