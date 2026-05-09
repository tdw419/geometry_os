; DESCRIPTION: Draws a white circle centered at (249, 44) with radius 36.
; PLAN: r0=249(x), r1=44(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 44
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
