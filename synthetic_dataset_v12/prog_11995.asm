; DESCRIPTION: Draws a purple circle centered at (168, 213) with radius 43.
; PLAN: r0=168(x), r1=213(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 213
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
