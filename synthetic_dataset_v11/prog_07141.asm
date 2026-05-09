; DESCRIPTION: Draws a purple circle centered at (173, 191) with radius 28.
; PLAN: r0=173(x), r1=191(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 191
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
