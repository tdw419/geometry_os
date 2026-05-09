; DESCRIPTION: Creates a orange circular shape at (361, 146) with radius 13.
; PLAN: r0=361(x), r1=146(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 146
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
