; DESCRIPTION: Draws a red circle centered at (436, 150) with radius 37.
; PLAN: r0=436(x), r1=150(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 150
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
