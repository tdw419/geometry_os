; DESCRIPTION: Places a orange line segment connecting (228, 170) to (52, 37).
; PLAN: r0=228(x1), r1=170(y1), r2=52(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 170
LDI r2, 52
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
