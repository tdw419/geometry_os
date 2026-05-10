; DESCRIPTION: Creates a purple circular shape at (323, 156) with radius 42.
; PLAN: r0=323(x), r1=156(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 156
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
