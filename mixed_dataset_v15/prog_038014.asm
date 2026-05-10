; DESCRIPTION: Creates a black circular shape at (387, 95) with radius 18.
; PLAN: r0=387(x), r1=95(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 95
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
