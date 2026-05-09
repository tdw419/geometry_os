; DESCRIPTION: Draws a white circle centered at (278, 197) with radius 32.
; PLAN: r0=278(x), r1=197(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 197
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
