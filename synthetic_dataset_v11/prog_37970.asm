; DESCRIPTION: Places a white line segment connecting (75, 245) to (12, 22).
; PLAN: r0=75(x1), r1=245(y1), r2=12(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 245
LDI r2, 12
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
