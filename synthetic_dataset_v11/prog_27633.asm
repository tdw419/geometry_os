; DESCRIPTION: Draws a blue circle centered at (125, 215) with radius 33.
; PLAN: r0=125(x), r1=215(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 215
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
