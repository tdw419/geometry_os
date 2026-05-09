; DESCRIPTION: Draws a white circle centered at (328, 99) with radius 24.
; PLAN: r0=328(x), r1=99(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 99
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
