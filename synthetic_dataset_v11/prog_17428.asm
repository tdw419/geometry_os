; DESCRIPTION: Places a white circle of radius 53 at center (131, 188).
; PLAN: r0=131(x), r1=188(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 188
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
