; DESCRIPTION: Creates a orange circular shape at (215, 99) with radius 36.
; PLAN: r0=215(x), r1=99(y), r2=36(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 99
LDI r2, 36
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
