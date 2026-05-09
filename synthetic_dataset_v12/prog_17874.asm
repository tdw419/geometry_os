; DESCRIPTION: Places a orange line segment connecting (463, 244) to (17, 57).
; PLAN: r0=463(x1), r1=244(y1), r2=17(x2), r3=57(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 244
LDI r2, 17
LDI r3, 57
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
