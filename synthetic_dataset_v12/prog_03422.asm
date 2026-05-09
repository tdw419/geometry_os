; DESCRIPTION: Places a white line segment connecting (183, 165) to (376, 17).
; PLAN: r0=183(x1), r1=165(y1), r2=376(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 165
LDI r2, 376
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
