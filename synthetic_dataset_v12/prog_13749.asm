; DESCRIPTION: Creates a orange circular shape at (330, 115) with radius 32.
; PLAN: r0=330(x), r1=115(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 330
LDI r1, 115
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
