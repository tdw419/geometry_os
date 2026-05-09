; DESCRIPTION: Places a white line segment connecting (102, 196) to (504, 148).
; PLAN: r0=102(x1), r1=196(y1), r2=504(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 196
LDI r2, 504
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
