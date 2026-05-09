; DESCRIPTION: Places a black circle of radius 13 at center (142, 42).
; PLAN: r0=142(x), r1=42(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 42
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
