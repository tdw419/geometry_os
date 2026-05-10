; DESCRIPTION: Draws a green circle centered at (256, 98) with radius 76.
; PLAN: r0=256(x), r1=98(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 98
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
