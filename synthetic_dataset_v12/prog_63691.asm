; DESCRIPTION: Creates a black circular shape at (103, 93) with radius 56.
; PLAN: r0=103(x), r1=93(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 93
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
