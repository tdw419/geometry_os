; DESCRIPTION: Creates a orange circular shape at (471, 90) with radius 17.
; PLAN: r0=471(x), r1=90(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 90
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
