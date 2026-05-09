; DESCRIPTION: Draws a black circle centered at (387, 106) with radius 40.
; PLAN: r0=387(x), r1=106(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 106
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
