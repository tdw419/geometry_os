; DESCRIPTION: Draws a blue circle centered at (111, 221) with radius 34.
; PLAN: r0=111(x), r1=221(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 221
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
