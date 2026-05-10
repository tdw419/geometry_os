; DESCRIPTION: Draws a yellow circle centered at (256, 206) with radius 47.
; PLAN: r0=256(x), r1=206(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 206
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
