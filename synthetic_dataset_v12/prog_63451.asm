; DESCRIPTION: Draws a blue circle centered at (73, 59) with radius 50.
; PLAN: r0=73(x), r1=59(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 59
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
