; DESCRIPTION: Creates a orange circular shape at (214, 166) with radius 38.
; PLAN: r0=214(x), r1=166(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 166
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
