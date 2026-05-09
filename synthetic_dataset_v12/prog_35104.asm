; DESCRIPTION: Draws a white circle centered at (237, 218) with radius 31.
; PLAN: r0=237(x), r1=218(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 218
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
