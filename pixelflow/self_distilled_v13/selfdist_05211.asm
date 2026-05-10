; DESCRIPTION: Draws a green circle centered at (394, 134) with radius 52.
; PLAN: r0=394(x), r1=134(y), r2=52(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 394
LDI r1, 134
LDI r2, 52
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
