; DESCRIPTION: Places a orange line segment connecting (303, 234) to (283, 167).
; PLAN: r0=303(x1), r1=234(y1), r2=283(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 234
LDI r2, 283
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
