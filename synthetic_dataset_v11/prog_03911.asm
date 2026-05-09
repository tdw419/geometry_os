; DESCRIPTION: Composite: . Then Places a orange line segment connecting (181, 193) to (55, 218). Then Creates a orange circular shape at (126, 84) with radius 63.
; PLAN: r0=181(x1), r1=193(y1), r2=55(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=126(x), r1=84(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a orange line segment connecting (181, 193) to (55, 218).
; PLAN: r0=181(x1), r1=193(y1), r2=55(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 193
LDI r2, 55
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (126, 84) with radius 63.
; PLAN: r0=126(x), r1=84(y), r2=63(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 84
LDI r2, 63
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
