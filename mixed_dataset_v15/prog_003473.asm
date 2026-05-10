; DESCRIPTION: Places a white circle of radius 21 at center (372, 49).
; PLAN: r0=372(x), r1=49(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 49
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
