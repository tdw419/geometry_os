; DESCRIPTION: Draws a white circle centered at (111, 180) with radius 65.
; PLAN: r0=111(x), r1=180(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 180
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
