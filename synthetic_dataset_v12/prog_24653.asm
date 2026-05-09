; DESCRIPTION: Creates a white circular shape at (392, 136) with radius 33.
; PLAN: r0=392(x), r1=136(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 136
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
