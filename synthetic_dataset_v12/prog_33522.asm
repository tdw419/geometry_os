; DESCRIPTION: Creates a orange circular shape at (190, 101) with radius 57.
; PLAN: r0=190(x), r1=101(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 101
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
