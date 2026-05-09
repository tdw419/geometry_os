; DESCRIPTION: Creates a orange circular shape at (59, 78) with radius 46.
; PLAN: r0=59(x), r1=78(y), r2=46(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 78
LDI r2, 46
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
