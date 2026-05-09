; DESCRIPTION: Places a white line segment connecting (68, 227) to (128, 238).
; PLAN: r0=68(x1), r1=227(y1), r2=128(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 227
LDI r2, 128
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
