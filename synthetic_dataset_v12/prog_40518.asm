; DESCRIPTION: Draws a yellow circle centered at (255, 102) with radius 71.
; PLAN: r0=255(x), r1=102(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 255
LDI r1, 102
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
