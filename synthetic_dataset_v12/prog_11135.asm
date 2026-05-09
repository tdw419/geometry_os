; DESCRIPTION: Draws a white circle centered at (371, 71) with radius 54.
; PLAN: r0=371(x), r1=71(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 71
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
