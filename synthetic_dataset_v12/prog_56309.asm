; DESCRIPTION: Draws a green circle centered at (61, 53) with radius 46.
; PLAN: r0=61(x), r1=53(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 53
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
