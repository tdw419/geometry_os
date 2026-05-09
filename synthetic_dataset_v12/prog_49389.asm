; DESCRIPTION: Draws a cyan circle centered at (136, 215) with radius 37.
; PLAN: r0=136(x), r1=215(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 215
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
