; DESCRIPTION: Draws a white circle centered at (108, 165) with radius 46.
; PLAN: r0=108(x), r1=165(y), r2=46(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 165
LDI r2, 46
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
