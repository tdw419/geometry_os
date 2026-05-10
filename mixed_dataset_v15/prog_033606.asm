; DESCRIPTION: Creates a magenta circular shape at (147, 99) with radius 27.
; PLAN: r0=147(x), r1=99(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 99
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
