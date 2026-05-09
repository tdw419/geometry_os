; DESCRIPTION: Creates a purple circular shape at (42, 66) with radius 26.
; PLAN: r0=42(x), r1=66(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 66
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
