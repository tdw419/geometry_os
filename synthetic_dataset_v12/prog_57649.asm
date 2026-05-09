; DESCRIPTION: Draws a white circle centered at (428, 211) with radius 33.
; PLAN: r0=428(x), r1=211(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 211
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
