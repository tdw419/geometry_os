; DESCRIPTION: Creates a orange circular shape at (188, 173) with radius 33.
; PLAN: r0=188(x), r1=173(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 173
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
