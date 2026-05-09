; DESCRIPTION: Places a orange line segment connecting (136, 59) to (283, 176).
; PLAN: r0=136(x1), r1=59(y1), r2=283(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 59
LDI r2, 283
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
