; DESCRIPTION: Draws a black circle centered at (387, 189) with radius 49.
; PLAN: r0=387(x), r1=189(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 189
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
