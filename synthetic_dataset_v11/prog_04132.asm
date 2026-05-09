; DESCRIPTION: Draws a blue circle centered at (127, 128) with radius 65.
; PLAN: r0=127(x), r1=128(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 128
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
