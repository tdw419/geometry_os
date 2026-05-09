; DESCRIPTION: Creates a orange circular shape at (236, 107) with radius 14.
; PLAN: r0=236(x), r1=107(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 107
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
