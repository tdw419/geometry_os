; DESCRIPTION: Places a white line segment connecting (200, 114) to (124, 58).
; PLAN: r0=200(x1), r1=114(y1), r2=124(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 114
LDI r2, 124
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
