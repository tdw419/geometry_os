; DESCRIPTION: Places a black circle of radius 42 at center (402, 81).
; PLAN: r0=402(x), r1=81(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 81
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
