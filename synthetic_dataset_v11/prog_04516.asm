; DESCRIPTION: Draws a blue circle centered at (217, 221) with radius 29.
; PLAN: r0=217(x), r1=221(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 221
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
