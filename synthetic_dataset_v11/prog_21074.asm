; DESCRIPTION: Draws a black circle centered at (161, 121) with radius 59.
; PLAN: r0=161(x), r1=121(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 121
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
