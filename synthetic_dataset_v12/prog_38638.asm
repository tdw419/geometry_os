; DESCRIPTION: Draws a black circle centered at (198, 134) with radius 57.
; PLAN: r0=198(x), r1=134(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 134
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
