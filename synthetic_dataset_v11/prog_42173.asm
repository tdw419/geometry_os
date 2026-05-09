; DESCRIPTION: Creates a white circular shape at (147, 166) with radius 60.
; PLAN: r0=147(x), r1=166(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 166
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
