; DESCRIPTION: Draws a yellow circle centered at (403, 61) with radius 61.
; PLAN: r0=403(x), r1=61(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 61
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
