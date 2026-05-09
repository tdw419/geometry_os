; DESCRIPTION: Creates a orange circular shape at (143, 22) with radius 17.
; PLAN: r0=143(x), r1=22(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 22
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
