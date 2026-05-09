; DESCRIPTION: Draws a white circle centered at (220, 36) with radius 34.
; PLAN: r0=220(x), r1=36(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 36
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
