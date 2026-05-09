; DESCRIPTION: Draws a blue circle centered at (98, 82) with radius 71.
; PLAN: r0=98(x), r1=82(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 82
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
