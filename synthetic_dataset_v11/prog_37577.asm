; DESCRIPTION: Places a orange line segment connecting (239, 184) to (248, 4).
; PLAN: r0=239(x1), r1=184(y1), r2=248(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 184
LDI r2, 248
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
