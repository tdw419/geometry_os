; DESCRIPTION: Draws a red circle centered at (329, 135) with radius 17.
; PLAN: r0=329(x), r1=135(y), r2=17(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 135
LDI r2, 17
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
