; DESCRIPTION: Draws a blue circle centered at (317, 64) with radius 54.
; PLAN: r0=317(x), r1=64(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 64
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
