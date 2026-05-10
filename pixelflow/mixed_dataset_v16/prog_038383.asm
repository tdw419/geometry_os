; DESCRIPTION: Places a white circle of radius 19 at center (254, 106).
; PLAN: r0=254(x), r1=106(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 106
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
