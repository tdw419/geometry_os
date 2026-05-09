; DESCRIPTION: Draws a white circle centered at (240, 208) with radius 36.
; PLAN: r0=240(x), r1=208(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 208
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
