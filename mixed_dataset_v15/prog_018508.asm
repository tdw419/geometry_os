; DESCRIPTION: Draws a cyan circle centered at (340, 96) with radius 64.
; PLAN: r0=340(x), r1=96(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 96
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
