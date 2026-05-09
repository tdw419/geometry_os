; DESCRIPTION: Creates a orange circular shape at (96, 164) with radius 47.
; PLAN: r0=96(x), r1=164(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 164
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
