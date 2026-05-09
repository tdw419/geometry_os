; DESCRIPTION: Draws a white circle centered at (68, 220) with radius 14.
; PLAN: r0=68(x), r1=220(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 220
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
