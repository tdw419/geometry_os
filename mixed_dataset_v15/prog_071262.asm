; DESCRIPTION: Draws a green circle centered at (278, 143) with radius 32.
; PLAN: r0=278(x), r1=143(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 143
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
