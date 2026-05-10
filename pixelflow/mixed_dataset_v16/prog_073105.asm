; DESCRIPTION: Draws a green circle centered at (63, 114) with radius 42.
; PLAN: r0=63(x), r1=114(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 114
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
