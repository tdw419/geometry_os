; DESCRIPTION: Places a white line segment connecting (111, 7) to (166, 232).
; PLAN: r0=111(x1), r1=7(y1), r2=166(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 7
LDI r2, 166
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
