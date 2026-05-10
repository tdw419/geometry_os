; DESCRIPTION: Draws a blue circle centered at (264, 111) with radius 65.
; PLAN: r0=264(x), r1=111(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 111
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
