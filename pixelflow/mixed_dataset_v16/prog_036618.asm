; DESCRIPTION: Places a orange line segment connecting (413, 143) to (329, 18).
; PLAN: r0=413(x1), r1=143(y1), r2=329(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 143
LDI r2, 329
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
