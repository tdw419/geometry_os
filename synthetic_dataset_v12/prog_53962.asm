; DESCRIPTION: Creates a white circular shape at (319, 166) with radius 57.
; PLAN: r0=319(x), r1=166(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 319
LDI r1, 166
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
