; DESCRIPTION: Draws a black circle centered at (387, 176) with radius 71.
; PLAN: r0=387(x), r1=176(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 176
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
