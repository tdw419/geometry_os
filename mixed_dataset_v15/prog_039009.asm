; DESCRIPTION: Places a white circle of radius 52 at center (181, 148).
; PLAN: r0=181(x), r1=148(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 148
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
