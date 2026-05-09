; DESCRIPTION: Creates a orange circular shape at (230, 161) with radius 72.
; PLAN: r0=230(x), r1=161(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 161
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
