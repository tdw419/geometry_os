; DESCRIPTION: Places a orange circle of radius 62 at center (401, 93).
; PLAN: r0=401(x), r1=93(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 93
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
