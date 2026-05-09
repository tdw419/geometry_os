; DESCRIPTION: Draws a cyan circle centered at (136, 211) with radius 32.
; PLAN: r0=136(x), r1=211(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 211
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
