; DESCRIPTION: Creates a blue circular shape at (163, 146) with radius 61.
; PLAN: r0=163(x), r1=146(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 146
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
