; DESCRIPTION: Draws a green circle centered at (50, 98) with radius 47.
; PLAN: r0=50(x), r1=98(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 98
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
