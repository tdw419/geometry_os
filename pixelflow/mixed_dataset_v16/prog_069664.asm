; DESCRIPTION: Creates a orange circular shape at (141, 197) with radius 43.
; PLAN: r0=141(x), r1=197(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 197
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
