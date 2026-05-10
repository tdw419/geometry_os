; DESCRIPTION: Renders a orange line segment connecting (354, 57) to (162, 187).
; PLAN: r0=354(x1), r1=57(y1), r2=162(x2), r3=187(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 57
LDI r2, 162
LDI r3, 187
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
