; DESCRIPTION: Draws a blue circle centered at (180, 111) with radius 59.
; PLAN: r0=180(x), r1=111(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 111
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
