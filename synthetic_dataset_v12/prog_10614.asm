; DESCRIPTION: Draws a blue circle centered at (220, 73) with radius 51.
; PLAN: r0=220(x), r1=73(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 73
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
