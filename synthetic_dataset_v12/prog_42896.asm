; DESCRIPTION: Places a orange line segment connecting (263, 151) to (17, 98).
; PLAN: r0=263(x1), r1=151(y1), r2=17(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 151
LDI r2, 17
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
