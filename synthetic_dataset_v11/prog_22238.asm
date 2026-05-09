; DESCRIPTION: Creates a blue circular shape at (100, 107) with radius 64.
; PLAN: r0=100(x), r1=107(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 107
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
