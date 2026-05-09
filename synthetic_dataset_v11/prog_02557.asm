; DESCRIPTION: Draws a green circle centered at (192, 120) with radius 53.
; PLAN: r0=192(x), r1=120(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 120
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
