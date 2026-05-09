; DESCRIPTION: Creates a cyan circular shape at (147, 183) with radius 56.
; PLAN: r0=147(x), r1=183(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 183
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
