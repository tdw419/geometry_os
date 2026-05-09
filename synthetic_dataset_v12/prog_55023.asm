; DESCRIPTION: Draws a cyan circle centered at (32, 165) with radius 30.
; PLAN: r0=32(x), r1=165(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 165
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
