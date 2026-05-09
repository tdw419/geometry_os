; DESCRIPTION: Places a orange line segment connecting (329, 117) to (320, 56).
; PLAN: r0=329(x1), r1=117(y1), r2=320(x2), r3=56(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 117
LDI r2, 320
LDI r3, 56
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
