; DESCRIPTION: Creates a orange circular shape at (424, 209) with radius 28.
; PLAN: r0=424(x), r1=209(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 209
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
