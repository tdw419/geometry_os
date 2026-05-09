; DESCRIPTION: Creates a white circular shape at (123, 193) with radius 50.
; PLAN: r0=123(x), r1=193(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 193
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
