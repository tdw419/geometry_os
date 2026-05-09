; DESCRIPTION: Creates a orange circular shape at (154, 46) with radius 29.
; PLAN: r0=154(x), r1=46(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 46
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
