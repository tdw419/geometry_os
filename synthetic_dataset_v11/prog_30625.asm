; DESCRIPTION: Draws a cyan circle centered at (189, 96) with radius 64.
; PLAN: r0=189(x), r1=96(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 96
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
