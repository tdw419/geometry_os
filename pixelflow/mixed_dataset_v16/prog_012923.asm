; DESCRIPTION: Draws a black circle centered at (60, 82) with radius 52.
; PLAN: r0=60(x), r1=82(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 82
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
