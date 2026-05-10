; DESCRIPTION: Draws a green circle centered at (239, 168) with radius 53.
; PLAN: r0=239(x), r1=168(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 168
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
