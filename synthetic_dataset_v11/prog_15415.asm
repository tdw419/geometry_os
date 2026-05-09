; DESCRIPTION: Draws a yellow circle centered at (116, 90) with radius 39.
; PLAN: r0=116(x), r1=90(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 90
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
