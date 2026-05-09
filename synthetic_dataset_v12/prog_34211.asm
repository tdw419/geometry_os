; DESCRIPTION: Creates a black circular shape at (147, 195) with radius 27.
; PLAN: r0=147(x), r1=195(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 195
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
