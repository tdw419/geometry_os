; DESCRIPTION: Places a white circle of radius 47 at center (399, 83).
; PLAN: r0=399(x), r1=83(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 83
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
