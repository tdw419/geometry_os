; DESCRIPTION: Draws a blue circle centered at (143, 60) with radius 57.
; PLAN: r0=143(x), r1=60(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 60
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
