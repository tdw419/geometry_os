; DESCRIPTION: Places a white circle of radius 53 at center (293, 178).
; PLAN: r0=293(x), r1=178(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 178
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
