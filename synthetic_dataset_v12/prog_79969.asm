; DESCRIPTION: Places a white circle of radius 13 at center (338, 214).
; PLAN: r0=338(x), r1=214(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 214
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
