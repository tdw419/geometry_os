; DESCRIPTION: Draws a black circle centered at (59, 190) with radius 29.
; PLAN: r0=59(x), r1=190(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 190
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
