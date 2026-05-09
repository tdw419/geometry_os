; DESCRIPTION: Draws a white circle centered at (378, 90) with radius 42.
; PLAN: r0=378(x), r1=90(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 90
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
