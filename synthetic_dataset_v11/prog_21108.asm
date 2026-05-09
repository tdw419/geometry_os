; DESCRIPTION: Draws a white circle centered at (73, 127) with radius 55.
; PLAN: r0=73(x), r1=127(y), r2=55(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 127
LDI r2, 55
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
