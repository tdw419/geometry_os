; DESCRIPTION: Places a white line segment connecting (33, 86) to (138, 109).
; PLAN: r0=33(x1), r1=86(y1), r2=138(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 86
LDI r2, 138
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
