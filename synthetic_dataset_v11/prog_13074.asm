; DESCRIPTION: Creates a orange circular shape at (173, 166) with radius 38.
; PLAN: r0=173(x), r1=166(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 166
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
