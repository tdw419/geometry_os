; DESCRIPTION: Creates a white circular shape at (296, 138) with radius 52.
; PLAN: r0=296(x), r1=138(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 138
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
