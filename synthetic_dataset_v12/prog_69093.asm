; DESCRIPTION: Draws a cyan circle centered at (136, 188) with radius 27.
; PLAN: r0=136(x), r1=188(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 188
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
