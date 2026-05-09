; DESCRIPTION: Creates a red circular shape at (375, 107) with radius 49.
; PLAN: r0=375(x), r1=107(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 107
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
