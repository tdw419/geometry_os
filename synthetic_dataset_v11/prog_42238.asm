; DESCRIPTION: Places a white line segment connecting (136, 138) to (142, 33).
; PLAN: r0=136(x1), r1=138(y1), r2=142(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 138
LDI r2, 142
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
