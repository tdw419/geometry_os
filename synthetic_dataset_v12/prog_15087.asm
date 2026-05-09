; DESCRIPTION: Creates a orange circular shape at (256, 97) with radius 17.
; PLAN: r0=256(x), r1=97(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 97
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
