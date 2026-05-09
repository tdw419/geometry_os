; DESCRIPTION: Creates a black circular shape at (385, 159) with radius 50.
; PLAN: r0=385(x), r1=159(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 159
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
