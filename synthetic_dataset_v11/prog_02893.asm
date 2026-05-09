; DESCRIPTION: Draws a cyan circle centered at (145, 224) with radius 22.
; PLAN: r0=145(x), r1=224(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 224
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
