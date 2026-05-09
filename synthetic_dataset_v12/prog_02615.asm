; DESCRIPTION: Places a white circle of radius 27 at center (194, 100).
; PLAN: r0=194(x), r1=100(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 100
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
