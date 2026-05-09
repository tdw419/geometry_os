; DESCRIPTION: Places a white circle of radius 16 at center (124, 159).
; PLAN: r0=124(x), r1=159(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 159
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
