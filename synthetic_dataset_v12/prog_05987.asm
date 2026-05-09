; DESCRIPTION: Draws a green circle centered at (168, 121) with radius 79.
; PLAN: r0=168(x), r1=121(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 121
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
