; DESCRIPTION: Draws a red circle centered at (111, 64) with radius 58.
; PLAN: r0=111(x), r1=64(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 64
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
