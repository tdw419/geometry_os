; DESCRIPTION: Draws a blue circle centered at (450, 59) with radius 33.
; PLAN: r0=450(x), r1=59(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 59
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
