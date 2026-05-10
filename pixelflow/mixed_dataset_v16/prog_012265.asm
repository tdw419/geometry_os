; DESCRIPTION: Creates a black circular shape at (147, 56) with radius 42.
; PLAN: r0=147(x), r1=56(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 56
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
