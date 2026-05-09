; DESCRIPTION: Places a white line segment connecting (253, 53) to (86, 33).
; PLAN: r0=253(x1), r1=53(y1), r2=86(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 53
LDI r2, 86
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
