; DESCRIPTION: Creates a orange circular shape at (242, 122) with radius 34.
; PLAN: r0=242(x), r1=122(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 122
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
