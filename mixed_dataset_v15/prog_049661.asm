; DESCRIPTION: Renders a white circular shape at (349, 121) with radius 23.
; PLAN: r0=349(x), r1=121(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 121
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
