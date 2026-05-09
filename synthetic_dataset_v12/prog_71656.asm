; DESCRIPTION: Draws a blue circle centered at (180, 153) with radius 71.
; PLAN: r0=180(x), r1=153(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 153
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
