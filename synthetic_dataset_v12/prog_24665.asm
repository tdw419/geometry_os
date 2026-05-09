; DESCRIPTION: Draws a white circle centered at (467, 191) with radius 21.
; PLAN: r0=467(x), r1=191(y), r2=21(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 191
LDI r2, 21
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
