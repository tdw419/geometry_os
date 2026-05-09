; DESCRIPTION: Places a white circle of radius 33 at center (111, 81).
; PLAN: r0=111(x), r1=81(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 81
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
