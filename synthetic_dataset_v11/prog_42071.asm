; DESCRIPTION: Creates a orange circular shape at (123, 120) with radius 55.
; PLAN: r0=123(x), r1=120(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 120
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
