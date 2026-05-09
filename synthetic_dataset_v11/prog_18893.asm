; DESCRIPTION: Draws a red circle centered at (111, 98) with radius 45.
; PLAN: r0=111(x), r1=98(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 98
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
