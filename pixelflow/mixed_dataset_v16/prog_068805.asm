; DESCRIPTION: Places a orange line segment connecting (17, 208) to (184, 142).
; PLAN: r0=17(x1), r1=208(y1), r2=184(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 208
LDI r2, 184
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
