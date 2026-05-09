; DESCRIPTION: Places a white line segment connecting (178, 170) to (170, 114).
; PLAN: r0=178(x1), r1=170(y1), r2=170(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 170
LDI r2, 170
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
