; DESCRIPTION: Creates a green circular shape at (117, 107) with radius 49.
; PLAN: r0=117(x), r1=107(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 107
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
