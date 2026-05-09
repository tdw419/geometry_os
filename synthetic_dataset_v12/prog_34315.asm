; DESCRIPTION: Creates a orange circular shape at (154, 159) with radius 26.
; PLAN: r0=154(x), r1=159(y), r2=26(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 159
LDI r2, 26
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
