; DESCRIPTION: Renders a white line segment connecting (7, 58) to (339, 183).
; PLAN: r0=7(x1), r1=58(y1), r2=339(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 58
LDI r2, 339
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
