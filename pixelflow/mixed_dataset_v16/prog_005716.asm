; DESCRIPTION: Creates a orange circular shape at (380, 133) with radius 19.
; PLAN: r0=380(x), r1=133(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 133
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
