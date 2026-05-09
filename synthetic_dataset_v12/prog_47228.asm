; DESCRIPTION: Draws a white circle centered at (86, 117) with radius 32.
; PLAN: r0=86(x), r1=117(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 117
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
