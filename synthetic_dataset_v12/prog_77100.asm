; DESCRIPTION: Draws a black circle centered at (322, 52) with radius 42.
; PLAN: r0=322(x), r1=52(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 52
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
