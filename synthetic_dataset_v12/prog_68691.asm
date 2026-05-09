; DESCRIPTION: Creates a white circular shape at (98, 230) with radius 11.
; PLAN: r0=98(x), r1=230(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 230
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
