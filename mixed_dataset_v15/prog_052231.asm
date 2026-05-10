; DESCRIPTION: Places a white circle of radius 66 at center (360, 83).
; PLAN: r0=360(x), r1=83(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 83
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
