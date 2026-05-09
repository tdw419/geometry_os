; DESCRIPTION: Draws a blue circle centered at (195, 180) with radius 64.
; PLAN: r0=195(x), r1=180(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 180
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
