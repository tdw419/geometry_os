; DESCRIPTION: Places a orange line segment connecting (235, 83) to (283, 166).
; PLAN: r0=235(x1), r1=83(y1), r2=283(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 83
LDI r2, 283
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
