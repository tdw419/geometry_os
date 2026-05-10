; DESCRIPTION: Renders a white line segment connecting (261, 52) to (34, 122).
; PLAN: r0=261(x1), r1=52(y1), r2=34(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 52
LDI r2, 34
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
