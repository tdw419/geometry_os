; DESCRIPTION: Draws a cyan circle centered at (128, 165) with radius 21.
; PLAN: r0=128(x), r1=165(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 165
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
