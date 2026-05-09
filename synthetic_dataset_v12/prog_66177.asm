; DESCRIPTION: Draws a cyan circle centered at (219, 165) with radius 74.
; PLAN: r0=219(x), r1=165(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 165
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
