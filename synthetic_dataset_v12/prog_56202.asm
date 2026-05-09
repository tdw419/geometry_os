; DESCRIPTION: Creates a orange circular shape at (374, 161) with radius 59.
; PLAN: r0=374(x), r1=161(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 374
LDI r1, 161
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
