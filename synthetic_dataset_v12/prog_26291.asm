; DESCRIPTION: Places a orange line segment connecting (239, 48) to (426, 211).
; PLAN: r0=239(x1), r1=48(y1), r2=426(x2), r3=211(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 48
LDI r2, 426
LDI r3, 211
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
