; DESCRIPTION: Places a orange line segment connecting (167, 0) to (256, 245).
; PLAN: r0=167(x1), r1=0(y1), r2=256(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 0
LDI r2, 256
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
