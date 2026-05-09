; DESCRIPTION: Creates a orange circular shape at (97, 209) with radius 21.
; PLAN: r0=97(x), r1=209(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 209
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
