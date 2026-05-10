; DESCRIPTION: Draws a cyan circle centered at (188, 17) with radius 71.
; PLAN: r0=188(x), r1=17(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 17
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
