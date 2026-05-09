; DESCRIPTION: Places a white line segment connecting (33, 109) to (246, 31).
; PLAN: r0=33(x1), r1=109(y1), r2=246(x2), r3=31(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 109
LDI r2, 246
LDI r3, 31
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
