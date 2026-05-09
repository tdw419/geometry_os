; DESCRIPTION: Draws a blue circle centered at (208, 132) with radius 42.
; PLAN: r0=208(x), r1=132(y), r2=42(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 208
LDI r1, 132
LDI r2, 42
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
