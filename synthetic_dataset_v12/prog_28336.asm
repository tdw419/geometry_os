; DESCRIPTION: Draws a green circle centered at (43, 169) with radius 27.
; PLAN: r0=43(x), r1=169(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 169
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
