; DESCRIPTION: Draws a white circle centered at (113, 127) with radius 35.
; PLAN: r0=113(x), r1=127(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 127
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
