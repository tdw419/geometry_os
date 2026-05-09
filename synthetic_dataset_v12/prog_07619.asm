; DESCRIPTION: Draws a green circle centered at (394, 102) with radius 50.
; PLAN: r0=394(x), r1=102(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 102
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
