; DESCRIPTION: Places a orange line segment connecting (426, 214) to (176, 13).
; PLAN: r0=426(x1), r1=214(y1), r2=176(x2), r3=13(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 214
LDI r2, 176
LDI r3, 13
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
