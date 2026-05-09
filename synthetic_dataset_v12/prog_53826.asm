; DESCRIPTION: Draws a black circle centered at (373, 152) with radius 48.
; PLAN: r0=373(x), r1=152(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 152
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
