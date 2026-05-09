; DESCRIPTION: Places a orange circle of radius 75 at center (401, 141).
; PLAN: r0=401(x), r1=141(y), r2=75(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 141
LDI r2, 75
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
