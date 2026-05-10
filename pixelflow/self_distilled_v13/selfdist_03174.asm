; DESCRIPTION: Renders a white line segment connecting (61, 170) to (135, 157).
; PLAN: r0=61(x1), r1=170(y1), r2=135(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 170
LDI r2, 135
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
