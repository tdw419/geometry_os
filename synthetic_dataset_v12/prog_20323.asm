; DESCRIPTION: Places a orange line segment connecting (118, 245) to (130, 240).
; PLAN: r0=118(x1), r1=245(y1), r2=130(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 245
LDI r2, 130
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
