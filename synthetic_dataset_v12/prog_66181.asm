; DESCRIPTION: Creates a black circular shape at (392, 203) with radius 45.
; PLAN: r0=392(x), r1=203(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 203
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
