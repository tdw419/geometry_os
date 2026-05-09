; DESCRIPTION: Places a orange line segment connecting (349, 241) to (329, 166).
; PLAN: r0=349(x1), r1=241(y1), r2=329(x2), r3=166(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 241
LDI r2, 329
LDI r3, 166
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
