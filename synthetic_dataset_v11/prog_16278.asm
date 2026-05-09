; DESCRIPTION: Draws a red circle centered at (171, 191) with radius 33.
; PLAN: r0=171(x), r1=191(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 191
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
