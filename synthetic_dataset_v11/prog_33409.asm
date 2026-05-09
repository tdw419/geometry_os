; DESCRIPTION: Places a black circle of radius 42 at center (102, 211).
; PLAN: r0=102(x), r1=211(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 211
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
