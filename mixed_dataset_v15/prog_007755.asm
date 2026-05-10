; DESCRIPTION: Places a white line segment connecting (119, 196) to (44, 194).
; PLAN: r0=119(x1), r1=196(y1), r2=44(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 196
LDI r2, 44
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
