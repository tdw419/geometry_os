; DESCRIPTION: Places a orange line segment connecting (187, 23) to (227, 173).
; PLAN: r0=187(x1), r1=23(y1), r2=227(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 23
LDI r2, 227
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
