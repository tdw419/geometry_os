; DESCRIPTION: Draws a white circle centered at (468, 45) with radius 31.
; PLAN: r0=468(x), r1=45(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 468
LDI r1, 45
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
