; DESCRIPTION: Places a white line segment connecting (182, 76) to (166, 129).
; PLAN: r0=182(x1), r1=76(y1), r2=166(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 76
LDI r2, 166
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
