; DESCRIPTION: Places a orange circle of radius 35 at center (82, 210).
; PLAN: r0=82(x), r1=210(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 210
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
