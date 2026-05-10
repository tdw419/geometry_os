; DESCRIPTION: Places a white line segment connecting (507, 170) to (75, 27).
; PLAN: r0=507(x1), r1=170(y1), r2=75(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 170
LDI r2, 75
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
