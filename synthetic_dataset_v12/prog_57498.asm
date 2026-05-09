; DESCRIPTION: Draws a blue circle centered at (454, 177) with radius 42.
; PLAN: r0=454(x), r1=177(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 177
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
