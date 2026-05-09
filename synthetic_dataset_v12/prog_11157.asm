; DESCRIPTION: Places a white line segment connecting (422, 27) to (102, 104).
; PLAN: r0=422(x1), r1=27(y1), r2=102(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 27
LDI r2, 102
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
