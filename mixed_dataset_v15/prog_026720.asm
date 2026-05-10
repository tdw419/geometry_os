; DESCRIPTION: Draws a green circle centered at (418, 143) with radius 47.
; PLAN: r0=418(x), r1=143(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 418
LDI r1, 143
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
