; DESCRIPTION: Places a orange line segment connecting (331, 166) to (294, 56).
; PLAN: r0=331(x1), r1=166(y1), r2=294(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 166
LDI r2, 294
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
