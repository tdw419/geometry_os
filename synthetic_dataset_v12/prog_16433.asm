; DESCRIPTION: Creates a orange circular shape at (281, 71) with radius 53.
; PLAN: r0=281(x), r1=71(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 71
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
