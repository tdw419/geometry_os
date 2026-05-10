; DESCRIPTION: Places a white disk with center (103, 55) and radius 38.
; PLAN: r0=103(x), r1=55(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 55
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
