; DESCRIPTION: Draws a green circle centered at (403, 165) with radius 63.
; PLAN: r0=403(x), r1=165(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 165
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
