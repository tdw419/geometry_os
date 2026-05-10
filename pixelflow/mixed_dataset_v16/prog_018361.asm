; DESCRIPTION: Creates a orange circular shape at (212, 159) with radius 52.
; PLAN: r0=212(x), r1=159(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 159
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
