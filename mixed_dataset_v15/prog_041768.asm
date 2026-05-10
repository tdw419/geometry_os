; DESCRIPTION: Draws a green circle centered at (271, 64) with radius 60.
; PLAN: r0=271(x), r1=64(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 271
LDI r1, 64
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
