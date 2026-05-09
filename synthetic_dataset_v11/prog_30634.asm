; DESCRIPTION: Draws a yellow circle centered at (131, 143) with radius 47.
; PLAN: r0=131(x), r1=143(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 143
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
