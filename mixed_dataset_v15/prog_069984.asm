; DESCRIPTION: Places a orange circle of radius 70 at center (401, 83).
; PLAN: r0=401(x), r1=83(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 83
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
