; DESCRIPTION: Creates a orange circular shape at (206, 171) with radius 14.
; PLAN: r0=206(x), r1=171(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 171
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
