; DESCRIPTION: Draws a blue circle centered at (63, 44) with radius 42.
; PLAN: r0=63(x), r1=44(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 44
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
