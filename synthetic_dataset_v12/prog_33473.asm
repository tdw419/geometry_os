; DESCRIPTION: Creates a magenta circular shape at (469, 107) with radius 18.
; PLAN: r0=469(x), r1=107(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 107
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
