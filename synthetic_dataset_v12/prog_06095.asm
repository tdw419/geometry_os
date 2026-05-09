; DESCRIPTION: Draws a blue circle centered at (243, 120) with radius 73.
; PLAN: r0=243(x), r1=120(y), r2=73(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 120
LDI r2, 73
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
